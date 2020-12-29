part of 'news_list_cubit.dart';

abstract class NewsState extends Equatable {
  const NewsState();

  @override
  List<Object> get props => [];
}

class NewsInitial extends NewsState {}

class NewsLoading extends NewsState {}

class NewsLoadingMore extends NewsState {}

class NewsLoadSuccess extends NewsState {
  final List<NewsEntity> news;
  final bool hasMore;

  NewsLoadSuccess(this.news, {this.hasMore = true});

  NewsLoadSuccess copyWith({
    List<NewsEntity> news,
    bool hasMore,
  }) =>
      NewsLoadSuccess(
        news ?? this.news,
        hasMore: hasMore ?? this.hasMore,
      );

  @override
  List<Object> get props => [news, hasMore];
}

class NewsLoadEmpty extends NewsState {
  final String message;

  NewsLoadEmpty({this.message = 'News data not available.'});

  @override
  List<Object> get props => [message];
}

class NewsLoadError extends NewsState {
  final String message;

  NewsLoadError({this.message = 'Unable to load data.'});

  @override
  List<Object> get props => [message];
}

class NewsError extends NewsState {
  final String message;

  NewsError({this.message});

  @override
  List<Object> get props => [message];
}
