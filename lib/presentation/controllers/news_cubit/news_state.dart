part of 'news_cubit.dart';


sealed class NewsAppState {}

final class NewsAppInitial extends NewsAppState{}
final class ChangeAppTheme extends NewsAppState{}
final class GetGeneralNewsLoading extends NewsAppState{}
final class GetGeneralNewsSuccess extends NewsAppState{}
final class GetGeneralNewsError extends NewsAppState {}
final class GetBusinessNewsLoading extends NewsAppState {}
final class GetBusinessNewsSuccess extends NewsAppState {}
final class GetBusinessNewsError extends NewsAppState {}
final class GetTechnologyNewsLoading extends NewsAppState {}
final class GetTechnologyNewsSuccess extends NewsAppState {}
final class GetTechnologyNewsError extends NewsAppState {}