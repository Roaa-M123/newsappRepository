import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/domain/entity/news_entity/news_entity.dart';
import 'package:newsapp/domain/use_case/news_use_cases/get_news_business_use_cases.dart';
import 'package:newsapp/domain/use_case/news_use_cases/get_news_general_use_cases.dart';
import 'package:newsapp/domain/use_case/news_use_cases/get_news_technology_use_cases.dart';

part 'news_state.dart';

class NewsAppCubit extends Cubit<NewsAppState> {
  NewsAppCubit(this._getGeneralNewsUseCase,this._getBusinessNewsUseCases, this._getNewsTechnologyUseCases,
      )
      : super(NewsAppInitial());
  static NewsAppCubit get(context) {
    return BlocProvider.of(context);
  }

  bool isLighttheme = true;

  void changeAppTheme() {
    isLighttheme = !isLighttheme;
    emit(ChangeAppTheme());
  }
  List<NewsEntity>generalList=[];
  List<NewsEntity>businessList=[];
  List<NewsEntity>technologyList=[];

  final GetGeneralNewsUseCase _getGeneralNewsUseCase;
  final GetBusinessNewsUseCases _getBusinessNewsUseCases;
  final GetNewsTechnologyUseCases _getNewsTechnologyUseCases;

  void getGeneralNews() async {
    final response =
        await _getGeneralNewsUseCase();
    response.fold((left) {
      emit(GetGeneralNewsError());
    }, (right) {
      generalList=right;
      emit(GetGeneralNewsSuccess());

    });
  }

  void getTechnologyNews() async {
    final response = await _getNewsTechnologyUseCases();
    response.fold((left) {
     emit(GetTechnologyNewsError());
    }, (right) {
      technologyList=right;
      emit(GetTechnologyNewsSuccess());
    });
  }

  void getBusinessNews() async {
    final response =
        await _getBusinessNewsUseCases();
    response.fold((left) {
      emit(GetBusinessNewsError());
    }, (right) {
      businessList=right;
      emit(GetBusinessNewsSuccess());

    });
  }

//
//   List< NewsArticleModel>generalList=[];
//   List< NewsArticleModel>businessList=[];
//   List< NewsArticleModel>technologyList=[];
//   final NewsDataSource _newsRemoteDataSource=NewsDataSource(dioHelper: DioHelper()) ;
// void getGeneral ()  async {
//  emit(GetGeneralLoading());
//  try{
// final response=await _newsRemoteDataSource.getNews(category:"general");
// generalList=response as List<NewsArticleModel>;
// emit(GetGeneralSuccess());
//  }catch(e){
//   print(e);
//   emit(GetGeneralError());
//  }
//  }
//  void getBusiness ()  async {
//   emit(GetBusinessLoading());
//   try{
//    final response=await _newsRemoteDataSource.getNews(category:"business");
//    businessList=response as List<NewsArticleModel>;
//    emit(GetBusinessSuccess());
//   }catch(e){
//    print(e);
//    emit(GetBusinessError());
//   }
//   }
//   void getTechnology()  async {
//  emit(GetTechnologyLoading());
//    try{
//     final response=await _newsRemoteDataSource.getNews(category:"technology");
//     technologyList=response as List<NewsArticleModel>;
//     emit(GetTechnologySuccess());
//    }catch(e){
//     print(e);
//     emit(GetTechnologyError());
//    }
//   }
}
