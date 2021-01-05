part of 'showcase_news_cubit.dart';

abstract class ShowcaseNewsState extends Equatable {
  const ShowcaseNewsState();

  @override
  List<Object> get props => [];
}

class ShowcaseNewsInitial extends ShowcaseNewsState {}

class ShowcaseNewsLoading extends ShowcaseNewsState {}

class ShowcaseNewsLoadingMore extends ShowcaseNewsState {}

class ShowcaseNewsLoadSuccess extends ShowcaseNewsState {
  final List<NewsEntity> news;
  final bool hasMore;

  ShowcaseNewsLoadSuccess(this.news, {this.hasMore = false});

  ShowcaseNewsLoadSuccess copyWith({
    List<NewsEntity> news,
    bool hasMore,
  }) =>
      ShowcaseNewsLoadSuccess(
        news ?? this.news,
        hasMore: hasMore ?? this.hasMore,
      );

  @override
  List<Object> get props => [news, hasMore];
}

class ShowcaseNewsLoadEmpty extends ShowcaseNewsState {
  final String message;

  ShowcaseNewsLoadEmpty({this.message = 'Showcase news data not available.'});

  @override
  List<Object> get props => [message];
}

class ShowcaseNewsLoadError extends ShowcaseNewsState {
  final String message;

  ShowcaseNewsLoadError({this.message = 'Unable to load data.'});

  @override
  List<Object> get props => [message];
}

class ShowcaseNewsError extends ShowcaseNewsState {
  final String message;

  ShowcaseNewsError({this.message});

  @override
  List<Object> get props => [message];
}
