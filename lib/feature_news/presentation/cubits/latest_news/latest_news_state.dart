part of 'latest_news_cubit.dart';

abstract class LatestNewsState extends Equatable {
  const LatestNewsState();

  @override
  List<Object> get props => [];
}

class LatestNewsInitial extends LatestNewsState {}

class LatestNewsLoading extends LatestNewsState {}

class LatestNewsLoadingMore extends LatestNewsState {}

class LatestNewsLoadSuccess extends LatestNewsState {
  final List<NewsEntity> news;
  final bool hasMore;

  LatestNewsLoadSuccess(this.news, {this.hasMore = false});

  LatestNewsLoadSuccess copyWith({
    List<NewsEntity> news,
    bool hasMore,
  }) =>
      LatestNewsLoadSuccess(
        news ?? this.news,
        hasMore: hasMore ?? this.hasMore,
      );

  @override
  List<Object> get props => [news, hasMore];
}

class LatestNewsLoadEmpty extends LatestNewsState {
  final String message;

  LatestNewsLoadEmpty({this.message = 'Latest news data not available.'});

  @override
  List<Object> get props => [message];
}

class LatestNewsLoadError extends LatestNewsState {
  final String message;

  LatestNewsLoadError({this.message = 'Unable to load data.'});

  @override
  List<Object> get props => [message];
}

class LatestNewsError extends LatestNewsState {
  final String message;

  LatestNewsError({this.message});

  @override
  List<Object> get props => [message];
}
