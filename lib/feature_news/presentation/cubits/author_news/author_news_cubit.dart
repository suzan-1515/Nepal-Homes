import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:nepal_homes/feature_news/domain/entities/news_entity.dart';
import 'package:nepal_homes/feature_news/domain/usecases/get_news_by_author_use_case.dart';

part 'author_news_state.dart';

class AuthorNewsCubit extends Cubit<AuthorNewsState> {
  final GetNewsByAuthorUseCase getAuthorNewsUseCase;

  AuthorNewsCubit({
    @required this.getAuthorNewsUseCase,
  }) : super(AuthorNewsInitial());

  int _page = 1;

  int get page => this._page;

  getAuthorNews({@required String authorId}) async {
    if (state is AuthorNewsLoading) return;
    emit(AuthorNewsLoading());
    try {
      _page = 1;
      final PaginatedNewsEntity paginatedNewsEntity = await getAuthorNewsUseCase
          .call(GetNewsByAuthorUseCaseParams(authorId: authorId, page: _page));
      if (paginatedNewsEntity == null ||
          paginatedNewsEntity.data == null ||
          paginatedNewsEntity.data.isEmpty)
        emit(AuthorNewsLoadEmpty(message: 'News data not available.'));
      else
        emit(AuthorNewsLoadSuccess(paginatedNewsEntity.data,
            hasMore: (paginatedNewsEntity.page * paginatedNewsEntity.size) <
                paginatedNewsEntity.totalData));
    } catch (e) {
      log('Author news load error: ', error: e);
      emit(AuthorNewsLoadError(
          message:
              'Unable to load news data. Make sure you are connected to Internet.'));
    }
  }

  refreshNews({@required String authorId}) async {
    if (state is AuthorNewsLoading) return;
    try {
      final PaginatedNewsEntity paginatedNewsEntity = await getAuthorNewsUseCase
          .call(GetNewsByAuthorUseCaseParams(authorId: authorId, page: _page));
      if (paginatedNewsEntity == null ||
          paginatedNewsEntity.data == null ||
          paginatedNewsEntity.data.isEmpty) {
        if (state is AuthorNewsLoadSuccess) {
          emit(AuthorNewsError(message: 'Unable to refresh data.'));
        } else
          emit(AuthorNewsLoadEmpty(message: 'News data not available.'));
      } else {
        _page = 1;
        emit(AuthorNewsLoadSuccess(paginatedNewsEntity.data,
            hasMore: (paginatedNewsEntity.page * paginatedNewsEntity.size) <
                paginatedNewsEntity.totalData));
      }
    } catch (e) {
      log('Author news load error: ', error: e);
      emit(AuthorNewsError(
          message:
              'Unable to refresh data. Make sure you are connected to Internet.'));
    }
  }

  getMoreNews({@required String authorId}) async {
    final currentState = state;
    if (currentState is AuthorNewsLoadingMore) return;
    emit(AuthorNewsLoadingMore());
    try {
      final PaginatedNewsEntity paginatedCategoryNewsListEntity =
          await getAuthorNewsUseCase.call(
        GetNewsByAuthorUseCaseParams(authorId: authorId, page: _page + 1),
      );
      if (paginatedCategoryNewsListEntity == null ||
          paginatedCategoryNewsListEntity.data == null ||
          paginatedCategoryNewsListEntity.data.isEmpty) {
        if (currentState is AuthorNewsLoadSuccess) {
          emit(currentState.copyWith(hasMore: false));
        } else
          emit(AuthorNewsLoadEmpty(message: 'News data not available.'));
      } else {
        _page += 1;
        if (currentState is AuthorNewsLoadSuccess) {
          emit(currentState.copyWith(
              news: currentState.news + paginatedCategoryNewsListEntity.data,
              hasMore: (paginatedCategoryNewsListEntity.page *
                      paginatedCategoryNewsListEntity.size) <
                  paginatedCategoryNewsListEntity.totalData));
        } else {
          emit(AuthorNewsLoadSuccess(paginatedCategoryNewsListEntity.data,
              hasMore: (paginatedCategoryNewsListEntity.page *
                      paginatedCategoryNewsListEntity.size) <
                  paginatedCategoryNewsListEntity.totalData));
        }
      }
    } catch (e) {
      log('Author news load more error: ', error: e);
      if (currentState is AuthorNewsLoadSuccess) {
        emit(currentState.copyWith(hasMore: false));
      } else
        emit(AuthorNewsError(
            message:
                'Unable to load more data. Make sure you are connected to Internet.'));
    }
  }
}
