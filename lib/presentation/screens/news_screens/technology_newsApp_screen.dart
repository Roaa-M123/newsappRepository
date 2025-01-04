import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/presentation/controllers/news_cubit/news_cubit.dart';
import 'package:newsapp/presentation/widgets/news_widgets/theme_button_control.dart';

import '../../widgets/news_widgets/list_view_widget.dart';
import '../../widgets/news_widgets/news_item.dart';
import '../../widgets/news_widgets/shimmerWidget.dart';

class TechnologyNewsappScreen extends StatelessWidget {
  const TechnologyNewsappScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Technology News",style: TextStyle(fontSize: 26)),
        actions: [
          ThemeSwitchButton(),
        ],
      ),
      body: BlocBuilder<NewsAppCubit, NewsAppState>(
        builder: (context, state) {
          var cubit = NewsAppCubit.get(context);
          return state is GetTechnologyNewsLoading
              ? const NewsShimmerListLoading()
              : ListViewWidget(
                 // listItem: cubit.technologyList,
                  itemBuilder: (BuildContext, index) =>
                      NewsItem(newsEntity: cubit.technologyList[index]),
                  itemCount: cubit.technologyList.length,
                );
        },
      ),
    );
  }
}
// ListView.separated(
// padding: EdgeInsets.symmetric(
// horizontal: 4,
// vertical: 32,
// ),
// itemBuilder: (context, index) {
// return NewsItem(
// newsArticleModel: cubit.technologyList[index]);
// },
// separatorBuilder: (context, index) {
// return SizedBox(
// height: 16,
// );
// },
// itemCount: cubit.technologyList.length);
