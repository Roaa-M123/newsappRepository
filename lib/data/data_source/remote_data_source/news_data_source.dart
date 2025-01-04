import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../core/network/dio_helper.dart';
import '../../../core/network/end_points.dart';
import '../../../core/network/news_api_key.dart';
import '../../models/news_models/get_news_model.dart';


class NewsDataSource {
  final DioHelper dioHelper;
  NewsDataSource({required this.dioHelper});

  Future<Either<String,NewsModel>> getNews({required String category}) async {
    try {
      // ignore: unused_local_variable
      final Response response = await DioHelper.getData(
        endPointpath: EndPoints.topHeadLines,
        queryParameters:{
          "category":category,
          "apiKey":ApiKey.newsApiKey,
        } ,
      );
      return Right(NewsModel.fromJson(response.data,));
    } catch (e) {
    return Left(e.toString());
    }
  }
}
//  List<NewsArticleModel>.from(response.data["articles"]
//           .map((item) => NewsArticleModel.fromJson(item)));
