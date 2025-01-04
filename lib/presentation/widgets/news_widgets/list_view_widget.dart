import 'package:flutter/cupertino.dart';

import '../../controllers/news_cubit/news_cubit.dart';

class ListViewWidget extends StatelessWidget {
  final Widget Function(BuildContext, int) itemBuilder;
  final int itemCount;
  ListViewWidget(
      {super.key,
      required this.itemBuilder,
      required this.itemCount});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.symmetric(
        horizontal:1,
        vertical: 24,
      ),
      itemCount: itemCount,
      itemBuilder: itemBuilder,
      separatorBuilder: (context, index) {
        return SizedBox(
          height: 16,
        );
      },
    );
  }
}
