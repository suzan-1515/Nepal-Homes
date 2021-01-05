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
  final List<NewsEntity> highlightNews;
  final List<NewsEntity> showcaseNews;
  final List<NewsEntity> trendingNews;
  final List<NewsEntity> recentNews;

  NewsLoadSuccess({
    this.highlightNews,
    this.showcaseNews,
    this.trendingNews,
    this.recentNews,
  });

  NewsLoadSuccess copyWith({
    List<NewsEntity> highlightNews,
    List<NewsEntity> showcaseNews,
    List<NewsEntity> trendingNews,
    List<NewsEntity> recentNews,
  }) =>
      NewsLoadSuccess(
        highlightNews: highlightNews ?? this.highlightNews,
        showcaseNews: showcaseNews ?? this.showcaseNews,
        trendingNews: trendingNews ?? this.trendingNews,
        recentNews: recentNews ?? this.recentNews,
      );

  @override
  List<Object> get props =>
      [highlightNews, showcaseNews, trendingNews, recentNews];
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
