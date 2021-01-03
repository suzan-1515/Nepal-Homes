part of 'news_detail_cubit.dart';

abstract class NewsDetailState extends Equatable {
  const NewsDetailState();

  @override
  List<Object> get props => [];
}

class NewsDetailInitial extends NewsDetailState {}

class NewsDetailLoading extends NewsDetailState {}

class NewsDetailLoadingMore extends NewsDetailState {}

class NewsDetailLoadSuccess extends NewsDetailState {
  final NewsDetailEntity news;

  NewsDetailLoadSuccess(this.news);

  @override
  List<Object> get props => [news];
}

class NewsDetailLoadEmpty extends NewsDetailState {
  final String message;

  NewsDetailLoadEmpty({this.message = 'News detail data not available.'});

  @override
  List<Object> get props => [message];
}

class NewsDetailLoadError extends NewsDetailState {
  final String message;

  NewsDetailLoadError({this.message = 'Unable to load data.'});

  @override
  List<Object> get props => [message];
}

class NewsDetailError extends NewsDetailState {
  final String message;

  NewsDetailError({this.message});

  @override
  List<Object> get props => [message];
}
