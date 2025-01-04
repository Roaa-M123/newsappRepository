import 'dart:core';
import 'package:dartz/dartz.dart';
import 'package:newsapp/domain/entity/news_entity/news_entity.dart';
import '../../../domain/repository/news_base_repository/news_base_repository.dart';
import '../../data_source/remote_data_source/news_data_source.dart';

class NewsRepository extends NewsBaseRepository {
  final NewsDataSource newsDataSource;

  NewsRepository({required this.newsDataSource});

  @override
  Future<Either<String, List<NewsEntity>>> getBusinessNews(
      {required String category}) async {
    final response = await newsDataSource.getNews(category:"business");
    return response.map((right){
      return  right.articles?.map((element) => element.toEntity()).toList() ?? [];
    });
  }

  @override
  Future<Either<String, List<NewsEntity>>> getGeneralNews(
      {required String category}) async {
    final response = await newsDataSource.getNews(category:"general");
    return response.map((right){
      return  right.articles?.map((element) => element.toEntity()).toList() ?? [];
    });
  }

  @override
  Future<Either<String, List<NewsEntity>>> getTechnologyNews(
      {required String category}) async {
    final response = await newsDataSource.getNews(category:"technology");
    return response.map((right){
      return  right.articles?.map((element) => element.toEntity()).toList() ?? [];
    });
  }
}
// final response = await newsDataSource.getNews(category: category);
//     return response.fold((left) {
//       return Left(left);
//     }, (right) {
//       return Right(
//           right.articles?.map((element) => element.toEntity()).toList() ?? []);
//     });
//   }