import 'package:dartz/dartz.dart';

import '../../../data/models/news_models/get_news_model.dart';
import '../../entity/news_entity/news_entity.dart';

abstract class NewsBaseRepository{
  Future<Either<String,List<NewsEntity>>>getGeneralNews({required String category});
  Future<Either<String,List<NewsEntity>>>getBusinessNews({required String category});
  Future<Either<String,List<NewsEntity>>>getTechnologyNews({required String category});
}