import 'package:dartz/dartz.dart';
import 'package:newsapp/domain/entity/news_entity/news_entity.dart';

import '../../repository/news_base_repository/news_base_repository.dart';

class GetFilteredTechnologyNewsUseCase{
  final NewsBaseRepository newsBaseRepository;

  GetFilteredTechnologyNewsUseCase({required this.newsBaseRepository});

  Future<Either<String,List<NewsEntity>>>getFilteredTechnologyNews({required String category})async{
    final response=await newsBaseRepository.getTechnologyNews(category:"technology");
    response.map((right){
      return right.where((element)=>element.title?.contains("a")==false);
    });
    return await newsBaseRepository.getTechnologyNews(category:"technology");

  }

}