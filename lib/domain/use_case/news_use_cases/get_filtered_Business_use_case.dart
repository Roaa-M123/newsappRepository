import 'package:dartz/dartz.dart';
import 'package:newsapp/domain/entity/news_entity/news_entity.dart';

import '../../repository/news_base_repository/news_base_repository.dart';

class GetFilteredBusinessNewsUseCase{
  final NewsBaseRepository newsBaseRepository;

  GetFilteredBusinessNewsUseCase({required this.newsBaseRepository});

  Future<Either<String,List<NewsEntity>>>getFilteredBusinessNews({required String category})async{
    final response=await newsBaseRepository.getBusinessNews(category:"business");
    response.map((right){
      return right.where((element)=>element.title?.contains("a")==false);
    });
    return await newsBaseRepository.getBusinessNews(category:"business");

  }

}