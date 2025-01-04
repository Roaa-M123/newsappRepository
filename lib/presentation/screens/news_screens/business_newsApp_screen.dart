import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/presentation/controllers/news_cubit/news_cubit.dart';
import 'package:newsapp/presentation/widgets/news_widgets/news_item.dart';
import 'package:newsapp/presentation/widgets/news_widgets/theme_button_control.dart';

import '../../widgets/news_widgets/list_view_widget.dart';
import '../../widgets/news_widgets/shimmerWidget.dart';

class BusinessNewsappScreen extends StatelessWidget {
  const BusinessNewsappScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Business News",style: TextStyle(fontSize: 26),),
         actions: [ThemeSwitchButton(),],
      ),
      body: BlocBuilder<NewsAppCubit, NewsAppState>(
        builder: (context, state) {
          var cubit = NewsAppCubit.get(context);
          return state is  GetBusinessNewsLoading
              ?NewsShimmerListLoading()
              :ListViewWidget(
            itemBuilder: (BuildContext, index) =>
                NewsItem(newsEntity: cubit.businessList[index]),
            itemCount: cubit.businessList.length,
          );
        },
      ),
    );
  }
}
