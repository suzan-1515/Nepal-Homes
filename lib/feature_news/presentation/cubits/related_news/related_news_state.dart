part of 'related_news_cubit.dart';

abstract class RelatedNewsState extends Equatable {
  const RelatedNewsState();

  @override
  List<Object> get props => [];
}

class RelatedNewsInitial extends RelatedNewsState {}

class RelatedNewsLoading extends RelatedNewsState {}

class RelatedNewsLoadingMore extends RelatedNewsState {}

class RelatedNewsLoadSuccess extends RelatedNewsState {
  final List<NewsEntity> news;

  RelatedNewsLoadSuccess(this.news);

  @override
  List<Object> get props => [news];
}

class RelatedNewsLoadEmpty extends RelatedNewsState {
  final String message;

  RelatedNewsLoadEmpty({this.message = 'Related news data not available.'});

  @override
  List<Object> get props => [message];
}

class RelatedNewsLoadError extends RelatedNewsState {
  final String message;

  RelatedNewsLoadError({this.message = 'Unable to load data.'});

  @override
  List<Object> get props => [message];
}

class RelatedNewsError extends RelatedNewsState {
  final String message;

  RelatedNewsError({this.message});

  @override
  List<Object> get props => [message];
}
