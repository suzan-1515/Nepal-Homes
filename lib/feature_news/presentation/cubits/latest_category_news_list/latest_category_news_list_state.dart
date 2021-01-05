part of 'latest_category_news_list_cubit.dart';

abstract class LatestCategoryNewsListState extends Equatable {
  const LatestCategoryNewsListState();

  @override
  List<Object> get props => [];
}

class LatestCategoryNewsListInitial extends LatestCategoryNewsListState {}

class LatestCategoryNewsListLoading extends LatestCategoryNewsListState {}

class LatestCategoryNewsListLoadingMore extends LatestCategoryNewsListState {}

class LatestCategoryNewsListLoadSuccess extends LatestCategoryNewsListState {
  final List<NewsEntity> news;

  LatestCategoryNewsListLoadSuccess(
    this.news,
  );

  @override
  List<Object> get props => [news];
}

class LatestCategoryNewsListLoadEmpty extends LatestCategoryNewsListState {
  final String message;

  LatestCategoryNewsListLoadEmpty(
      {this.message = 'Category news data not available.'});

  @override
  List<Object> get props => [message];
}

class LatestCategoryNewsListLoadError extends LatestCategoryNewsListState {
  final String message;

  LatestCategoryNewsListLoadError({this.message = 'Unable to load data.'});

  @override
  List<Object> get props => [message];
}

class LatestCategoryNewsListError extends LatestCategoryNewsListState {
  final String message;

  LatestCategoryNewsListError({this.message});

  @override
  List<Object> get props => [message];
}
