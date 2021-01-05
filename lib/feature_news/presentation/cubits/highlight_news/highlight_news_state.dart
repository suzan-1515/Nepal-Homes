part of 'highlight_news_cubit.dart';

abstract class HighlightNewsState extends Equatable {
  const HighlightNewsState();

  @override
  List<Object> get props => [];
}

class HighlightNewsInitial extends HighlightNewsState {}

class HighlightNewsLoading extends HighlightNewsState {}

class HighlightNewsLoadingMore extends HighlightNewsState {}

class HighlightNewsLoadSuccess extends HighlightNewsState {
  final List<NewsEntity> news;
  final bool hasMore;

  HighlightNewsLoadSuccess(this.news, {this.hasMore = false});

  HighlightNewsLoadSuccess copyWith({
    List<NewsEntity> news,
    bool hasMore,
  }) =>
      HighlightNewsLoadSuccess(
        news ?? this.news,
        hasMore: hasMore ?? this.hasMore,
      );

  @override
  List<Object> get props => [news, hasMore];
}

class HighlightNewsLoadEmpty extends HighlightNewsState {
  final String message;

  HighlightNewsLoadEmpty({this.message = 'Highlight news data not available.'});

  @override
  List<Object> get props => [message];
}

class HighlightNewsLoadError extends HighlightNewsState {
  final String message;

  HighlightNewsLoadError({this.message = 'Unable to load data.'});

  @override
  List<Object> get props => [message];
}

class HighlightNewsError extends HighlightNewsState {
  final String message;

  HighlightNewsError({this.message});

  @override
  List<Object> get props => [message];
}
