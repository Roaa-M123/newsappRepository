import 'package:dartz/dartz.dart';
import 'package:newsapp/domain/entity/news_entity/news_entity.dart';

import '../../repository/news_base_repository/news_base_repository.dart';

class GetNewsTechnologyUseCases{
  final NewsBaseRepository newsBaseRepository;

  GetNewsTechnologyUseCases({required this.newsBaseRepository});

  Future<Either<String,List<NewsEntity>>>call()async{
    return await newsBaseRepository.getTechnologyNews(category:"technology");

  }

}