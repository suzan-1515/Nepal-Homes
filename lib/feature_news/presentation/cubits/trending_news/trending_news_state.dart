part of 'trending_news_cubit.dart';

abstract class TrendingNewsState extends Equatable {
  const TrendingNewsState();

  @override
  List<Object> get props => [];
}

class TrendingNewsInitial extends TrendingNewsState {}

class TrendingNewsLoading extends TrendingNewsState {}

class TrendingNewsLoadingMore extends TrendingNewsState {}

class TrendingNewsLoadSuccess extends TrendingNewsState {
  final List<NewsEntity> news;
  final bool hasMore;

  TrendingNewsLoadSuccess(this.news, {this.hasMore = false});

  TrendingNewsLoadSuccess copyWith({
    List<NewsEntity> news,
    bool hasMore,
  }) =>
      TrendingNewsLoadSuccess(
        news ?? this.news,
        hasMore: hasMore ?? this.hasMore,
      );

  @override
  List<Object> get props => [news, hasMore];
}

class TrendingNewsLoadEmpty extends TrendingNewsState {
  final String message;

  TrendingNewsLoadEmpty({this.message = 'Trending news data not available.'});

  @override
  List<Object> get props => [message];
}

class TrendingNewsLoadError extends TrendingNewsState {
  final String message;

  TrendingNewsLoadError({this.message = 'Unable to load data.'});

  @override
  List<Object> get props => [message];
}

class TrendingNewsError extends TrendingNewsState {
  final String message;

  TrendingNewsError({this.message});

  @override
  List<Object> get props => [message];
}
