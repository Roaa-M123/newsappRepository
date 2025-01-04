import 'package:dartz/dartz.dart';
import 'package:newsapp/domain/entity/news_entity/news_entity.dart';

import '../../repository/news_base_repository/news_base_repository.dart';

class GetFilteredGeneralNewsUseCase{
  final NewsBaseRepository newsBaseRepository;

  GetFilteredGeneralNewsUseCase({required this.newsBaseRepository});

  Future<Either<String,List<NewsEntity>>>getFilteredGeneralNews({required String category})async{
    final response=await newsBaseRepository.getGeneralNews(category:"general");
    response.map((right){
      return right.where((element)=>element.title?.contains("a")==false);
    });
    return await newsBaseRepository.getGeneralNews(category:"general");

  }

}