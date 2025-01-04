import 'package:get_it/get_it.dart';
import 'package:newsapp/core/network/dio_helper.dart';
import 'package:newsapp/data/data_source/remote_data_source/news_data_source.dart';
import 'package:newsapp/data/repository/news_repository/news_repository.dart';
import 'package:newsapp/domain/use_case/news_use_cases/get_news_business_use_cases.dart';
import 'package:newsapp/domain/use_case/news_use_cases/get_news_general_use_cases.dart';
import 'package:newsapp/domain/use_case/news_use_cases/get_news_technology_use_cases.dart';
import 'package:newsapp/presentation/controllers/news_cubit/news_cubit.dart';

final getIt = GetIt.instance;

void setup() {
  //dioHelperInjection
  getIt.registerSingleton(DioHelper());
  //NewsDataSourceInjection
  getIt.registerSingleton(NewsDataSource(dioHelper: getIt<DioHelper>()));
  //NewsRepositoryInjection
  getIt.registerSingleton(
      NewsRepository(newsDataSource: getIt<NewsDataSource>()));
  //UseCases
  getIt.registerSingleton(
      GetGeneralNewsUseCase(newsBaseRepository: getIt<NewsRepository>()));
  getIt.registerSingleton(
      GetBusinessNewsUseCases(newsBaseRepository: getIt<NewsRepository>()));
  getIt.registerSingleton(
      GetNewsTechnologyUseCases(newsBaseRepository: getIt<NewsRepository>()));
  getIt.registerFactory(() => NewsAppCubit(
        getIt(),
        getIt(),
        getIt(),//factory function(anonymas)
      ));
}
