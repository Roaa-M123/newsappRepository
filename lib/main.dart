import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/core/Bloc_Observer.dart';
import 'package:newsapp/core/cache_helper.dart';
import 'package:newsapp/core/network/dio_helper.dart';
import 'package:newsapp/core/service_locator/service_locator.dart';
import 'package:newsapp/core/theme/ap_theme.dart';
import 'core/app_router/app_router.dart';
import 'core/app_router/screens_name.dart';
import 'presentation/controllers/news_cubit/news_cubit.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.initDio();
  await CacheHelper.initSharedPres();
  setup();
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers:[BlocProvider(
          create: (context) => getIt<NewsAppCubit>()..getGeneralNews()..getBusinessNews()..getTechnologyNews(),
        ),],
        child: BlocBuilder<NewsAppCubit, NewsAppState>(
  builder: (context, state) {
    var cubit = NewsAppCubit.get(context);
    return MaterialApp(
      title: "newsApp",
      theme: AppTheme.getLightTheme(),
      themeMode: cubit.isLighttheme ? ThemeMode.light : ThemeMode.dark,
      darkTheme: AppTheme.getDarkTheme(),
      onGenerateRoute:AppRouter.onGenerateRoute,
      initialRoute: ScreensName.splashScreen,
    );
  },
)
    );
  }
}

//GetGeneralNewsUseCase(newsBaseRepository: data source
// = diohelber),GetBusinessNewsUseCases(newsBaseRepository: ), GetNewsTechnologyUseCases(newsBaseRepository: )
