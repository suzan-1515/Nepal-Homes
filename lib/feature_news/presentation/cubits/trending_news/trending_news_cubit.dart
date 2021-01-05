import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:nepal_homes/core/usecases/usecase.dart';
import 'package:nepal_homes/feature_news/domain/entities/news_entity.dart';
import 'package:nepal_homes/feature_news/domain/usecases/usecases.dart';

part 'trending_news_state.dart';

class TrendingNewsCubit extends Cubit<TrendingNewsState> {
  final GetTrendingNewsUseCase getTrendingNewsUseCase;

  TrendingNewsCubit({
    @required this.getTrendingNewsUseCase,
  }) : super(TrendingNewsInitial());

  getNews() async {
    if (state is TrendingNewsLoading) return;
    emit(TrendingNewsLoading());
    try {
      final PaginatedNewsEntity paginatedNewsEntity =
          await getTrendingNewsUseCase.call(NoParams());
      if (paginatedNewsEntity == null ||
          paginatedNewsEntity.data == null ||
          paginatedNewsEntity.data.isEmpty)
        emit(TrendingNewsLoadEmpty(message: 'News data not available.'));
      else
        emit(TrendingNewsLoadSuccess(paginatedNewsEntity.data));
    } catch (e) {
      log('Trending news load error: ', error: e);
      emit(TrendingNewsLoadError(
          message:
              'Unable to load news data. Make sure you are connected to Internet.'));
    }
  }

  refreshNews() async {
    if (state is TrendingNewsLoading) return;
    try {
      final PaginatedNewsEntity paginatedNewsEntity =
          await getTrendingNewsUseCase.call(NoParams());
      if (paginatedNewsEntity == null ||
          paginatedNewsEntity.data == null ||
          paginatedNewsEntity.data.isEmpty) {
        if (state is TrendingNewsLoadSuccess) {
          emit(TrendingNewsError(message: 'Unable to refresh data.'));
        } else
          emit(TrendingNewsLoadEmpty(message: 'News data not available.'));
      } else {
        emit(TrendingNewsLoadSuccess(paginatedNewsEntity.data));
      }
    } catch (e) {
      log('Trending news load error: ', error: e);
      emit(TrendingNewsError(
          message:
              'Unable to refresh data. Make sure you are connected to Internet.'));
    }
  }
}
