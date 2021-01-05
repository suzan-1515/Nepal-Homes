import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:nepal_homes/feature_news/domain/entities/news_entity.dart';
import 'package:nepal_homes/feature_news/domain/usecases/usecases.dart';

part 'latest_category_news_list_state.dart';

class LatestCategoryNewsListCubit extends Cubit<LatestCategoryNewsListState> {
  final GetLatestNewsByCategoryUseCase getLatestCategoryNewsListUseCase;

  LatestCategoryNewsListCubit({
    @required this.getLatestCategoryNewsListUseCase,
  }) : super(LatestCategoryNewsListInitial());

  getCategoryNews({@required String categoryId}) async {
    if (state is LatestCategoryNewsListLoading) return;
    emit(LatestCategoryNewsListLoading());
    try {
      final PaginatedNewsEntity paginatedNewsListEntity =
          await getLatestCategoryNewsListUseCase.call(
        GetLatestNewsByCategoryUseCaseParams(size: 4, categoryId: categoryId),
      );
      if (paginatedNewsListEntity == null ||
          paginatedNewsListEntity.data == null ||
          paginatedNewsListEntity.data.isEmpty)
        emit(LatestCategoryNewsListLoadEmpty(
            message: 'Category news data not available.'));
      else
        emit(LatestCategoryNewsListLoadSuccess(paginatedNewsListEntity.data));
    } catch (e) {
      log('Category news load error: ', error: e);
      emit(LatestCategoryNewsListLoadError(
          message:
              'Unable to load news data. Make sure you are connected to Internet.'));
    }
  }

  refreshCategoryNews({@required String categoryId}) async {
    if (state is LatestCategoryNewsListLoading) return;
    try {
      final PaginatedNewsEntity paginatedNewsListEntity =
          await getLatestCategoryNewsListUseCase.call(
        GetLatestNewsByCategoryUseCaseParams(size: 4, categoryId: categoryId),
      );
      if (paginatedNewsListEntity == null ||
          paginatedNewsListEntity.data == null ||
          paginatedNewsListEntity.data.isEmpty) {
        if (state is LatestCategoryNewsListLoadSuccess) {
          emit(LatestCategoryNewsListError(message: 'Unable to refresh data.'));
        } else
          emit(LatestCategoryNewsListLoadEmpty(
              message: 'Category news data not available.'));
      } else {
        emit(LatestCategoryNewsListLoadSuccess(paginatedNewsListEntity.data));
      }
    } catch (e) {
      log('Category news load error: ', error: e);
      emit(LatestCategoryNewsListError(
          message:
              'Unable to refresh data. Make sure you are connected to Internet.'));
    }
  }
}
