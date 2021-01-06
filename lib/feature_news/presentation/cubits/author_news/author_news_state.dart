part of 'author_news_cubit.dart';

abstract class AuthorNewsState extends Equatable {
  const AuthorNewsState();

  @override
  List<Object> get props => [];
}

class AuthorNewsInitial extends AuthorNewsState {}

class AuthorNewsLoading extends AuthorNewsState {}

class AuthorNewsLoadingMore extends AuthorNewsState {}

class AuthorNewsLoadSuccess extends AuthorNewsState {
  final List<NewsEntity> news;
  final bool hasMore;

  AuthorNewsLoadSuccess(this.news, {this.hasMore = true});
  AuthorNewsLoadSuccess copyWith({
    List<NewsEntity> news,
    bool hasMore,
  }) =>
      AuthorNewsLoadSuccess(
        news ?? this.news,
        hasMore: hasMore ?? this.hasMore,
      );

  @override
  List<Object> get props => [news, hasMore];
}

class AuthorNewsLoadEmpty extends AuthorNewsState {
  final String message;

  AuthorNewsLoadEmpty({this.message = 'Author news data not available.'});

  @override
  List<Object> get props => [message];
}

class AuthorNewsLoadError extends AuthorNewsState {
  final String message;

  AuthorNewsLoadError({this.message = 'Unable to load data.'});

  @override
  List<Object> get props => [message];
}

class AuthorNewsError extends AuthorNewsState {
  final String message;

  AuthorNewsError({this.message});

  @override
  List<Object> get props => [message];
}
