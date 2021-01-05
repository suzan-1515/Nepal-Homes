import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:nepal_homes/feature_news/domain/entities/news_entity.dart';
import 'package:nepal_homes/feature_news/domain/usecases/usecases.dart';

part 'category_news_list_state.dart';

class CategoryNewsListCubit extends Cubit<CategoryNewsListState> {
  final GetCategoryNewsUseCase getCategoryNewsListUseCase;

  CategoryNewsListCubit({
    @required this.getCategoryNewsListUseCase,
  }) : super(CategoryNewsListInitial());

  int _page = 1;

  int get page => this._page;

  getCategoryNews({@required String categorySlug}) async {
    if (state is CategoryNewsListLoading) return;
    emit(CategoryNewsListLoading());
    try {
      _page = 1;
      final PaginatedNewsEntity paginatedCategoryNewsListEntity =
          await getCategoryNewsListUseCase.call(
        GetCategoryNewsUseCaseParams(page: _page, slug: categorySlug),
      );
      if (paginatedCategoryNewsListEntity == null ||
          paginatedCategoryNewsListEntity.data == null ||
          paginatedCategoryNewsListEntity.data.isEmpty)
        emit(CategoryNewsListLoadEmpty(
            message: 'Category news data not available.'));
      else
        emit(CategoryNewsListLoadSuccess(paginatedCategoryNewsListEntity.data,
            hasMore: (paginatedCategoryNewsListEntity.page *
                    paginatedCategoryNewsListEntity.size) <
                paginatedCategoryNewsListEntity.totalData));
    } catch (e) {
      log('Category news load error: ', error: e);
      emit(CategoryNewsListLoadError(
          message:
              'Unable to load news data. Make sure you are connected to Internet.'));
    }
  }

  refreshCategoryNews({@required String categorySlug}) async {
    if (state is CategoryNewsListLoading) return;
    try {
      final PaginatedNewsEntity paginatedCategoryNewsListEntity =
          await getCategoryNewsListUseCase.call(
        GetCategoryNewsUseCaseParams(page: _page, slug: categorySlug),
      );
      if (paginatedCategoryNewsListEntity == null ||
          paginatedCategoryNewsListEntity.data == null ||
          paginatedCategoryNewsListEntity.data.isEmpty) {
        if (state is CategoryNewsListLoadSuccess) {
          emit(CategoryNewsListError(message: 'Unable to refresh data.'));
        } else
          emit(CategoryNewsListLoadEmpty(
              message: 'Category news data not available.'));
      } else {
        _page = 1;
        emit(CategoryNewsListLoadSuccess(paginatedCategoryNewsListEntity.data,
            hasMore: (paginatedCategoryNewsListEntity.page *
                    paginatedCategoryNewsListEntity.size) <
                paginatedCategoryNewsListEntity.totalData));
      }
    } catch (e) {
      log('Category news load error: ', error: e);
      emit(CategoryNewsListError(
          message:
              'Unable to refresh data. Make sure you are connected to Internet.'));
    }
  }

  getMoreCategoryNews({@required String categorySlug}) async {
    final currentState = state;
    if (currentState is CategoryNewsListLoadingMore) return;
    emit(CategoryNewsListLoadingMore());
    try {
      final PaginatedNewsEntity paginatedCategoryNewsListEntity =
          await getCategoryNewsListUseCase.call(
        GetCategoryNewsUseCaseParams(page: _page + 1, slug: categorySlug),
      );
      if (paginatedCategoryNewsListEntity == null ||
          paginatedCategoryNewsListEntity.data == null ||
          paginatedCategoryNewsListEntity.data.isEmpty) {
        if (currentState is CategoryNewsListLoadSuccess) {
          emit(currentState.copyWith(hasMore: false));
        } else
          emit(CategoryNewsListLoadEmpty(
              message: 'Category news data not available.'));
      } else {
        _page += 1;
        if (currentState is CategoryNewsListLoadSuccess) {
          emit(currentState.copyWith(
              news: currentState.news + paginatedCategoryNewsListEntity.data,
              hasMore: (paginatedCategoryNewsListEntity.page *
                      paginatedCategoryNewsListEntity.size) <
                  paginatedCategoryNewsListEntity.totalData));
        } else {
          emit(CategoryNewsListLoadSuccess(paginatedCategoryNewsListEntity.data,
              hasMore: (paginatedCategoryNewsListEntity.page *
                      paginatedCategoryNewsListEntity.size) <
                  paginatedCategoryNewsListEntity.totalData));
        }
      }
    } catch (e) {
      log('Category news load more error: ', error: e);
      if (currentState is CategoryNewsListLoadSuccess) {
        emit(currentState.copyWith(hasMore: false));
      } else
        emit(CategoryNewsListError(
            message:
                'Unable to load more data. Make sure you are connected to Internet.'));
    }
  }
}
