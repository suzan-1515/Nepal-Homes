part of 'category_news_list_cubit.dart';

abstract class CategoryNewsListState extends Equatable {
  const CategoryNewsListState();

  @override
  List<Object> get props => [];
}

class CategoryNewsListInitial extends CategoryNewsListState {}

class CategoryNewsListLoading extends CategoryNewsListState {}

class CategoryNewsListLoadingMore extends CategoryNewsListState {}

class CategoryNewsListLoadSuccess extends CategoryNewsListState {
  final List<NewsEntity> news;
  final bool hasMore;

  CategoryNewsListLoadSuccess(this.news, {this.hasMore = true});

  CategoryNewsListLoadSuccess copyWith({
    List<NewsEntity> news,
    bool hasMore,
  }) =>
      CategoryNewsListLoadSuccess(
        news ?? this.news,
        hasMore: hasMore ?? this.hasMore,
      );

  @override
  List<Object> get props => [news, hasMore];
}

class CategoryNewsListLoadEmpty extends CategoryNewsListState {
  final String message;

  CategoryNewsListLoadEmpty(
      {this.message = 'Category news data not available.'});

  @override
  List<Object> get props => [message];
}

class CategoryNewsListLoadError extends CategoryNewsListState {
  final String message;

  CategoryNewsListLoadError({this.message = 'Unable to load data.'});

  @override
  List<Object> get props => [message];
}

class CategoryNewsListError extends CategoryNewsListState {
  final String message;

  CategoryNewsListError({this.message});

  @override
  List<Object> get props => [message];
}
