part of 'news_category_cubit.dart';

abstract class NewsCategoryState extends Equatable {
  const NewsCategoryState();

  @override
  List<Object> get props => [];
}

class NewsCategoryInitial extends NewsCategoryState {}

class NewsCategoryLoading extends NewsCategoryState {}

class NewsCategoryLoadingMore extends NewsCategoryState {}

class NewsCategoryLoadSuccess extends NewsCategoryState {
  final List<CategoryEntity> categories;
  final bool hasMore;

  NewsCategoryLoadSuccess(this.categories, {this.hasMore = false});

  NewsCategoryLoadSuccess copyWith({
    List<CategoryEntity> news,
    bool hasMore,
  }) =>
      NewsCategoryLoadSuccess(
        news ?? this.categories,
        hasMore: hasMore ?? this.hasMore,
      );

  @override
  List<Object> get props => [categories, hasMore];
}

class NewsCategoryLoadEmpty extends NewsCategoryState {
  final String message;

  NewsCategoryLoadEmpty({this.message = 'Latest news data not available.'});

  @override
  List<Object> get props => [message];
}

class NewsCategoryLoadError extends NewsCategoryState {
  final String message;

  NewsCategoryLoadError({this.message = 'Unable to load data.'});

  @override
  List<Object> get props => [message];
}

class NewsCategoryError extends NewsCategoryState {
  final String message;

  NewsCategoryError({this.message});

  @override
  List<Object> get props => [message];
}
