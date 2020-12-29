import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:nepal_homes/feature_news/domain/entities/news_entity.dart';
import 'package:nepal_homes/feature_news/domain/usecases/usecases.dart';

part 'news_list_state.dart';

class NewsListCubit extends Cubit<NewsState> {
  final GetNewsUseCase getNewsUseCase;

  NewsListCubit({
    @required this.getNewsUseCase,
  }) : super(NewsInitial());

  int _page = 1;

  int get page => this._page;

  getNews() async {
    if (state is NewsLoading) return;
    emit(NewsLoading());
    try {
      _page = 1;
      final PaginatedNewsEntity paginatedNewsEntity = await getNewsUseCase.call(
        GetNewsUseCaseParams(page),
      );
      if (paginatedNewsEntity == null ||
          paginatedNewsEntity.data == null ||
          paginatedNewsEntity.data.isEmpty)
        emit(NewsLoadEmpty(message: 'News data not available.'));
      else
        emit(NewsLoadSuccess(paginatedNewsEntity.data,
            hasMore: (paginatedNewsEntity.page * paginatedNewsEntity.size) <
                paginatedNewsEntity.totalData));
    } catch (e) {
      log('News load error: ', error: e);
      emit(NewsLoadError(
          message:
              'Unable to load news data. Make sure you are connected to Internet.'));
    }
  }

  refreshNews() async {
    if (state is NewsLoading) return;
    try {
      final PaginatedNewsEntity paginatedNewsEntity = await getNewsUseCase.call(
        GetNewsUseCaseParams(page),
      );
      if (paginatedNewsEntity == null ||
          paginatedNewsEntity.data == null ||
          paginatedNewsEntity.data.isEmpty) {
        if (state is NewsLoadSuccess) {
          emit(NewsError(message: 'Unable to refresh data.'));
        } else
          emit(NewsLoadEmpty(message: 'News data not available.'));
      } else {
        _page = 1;
        emit(NewsLoadSuccess(paginatedNewsEntity.data,
            hasMore: (paginatedNewsEntity.page * paginatedNewsEntity.size) <
                paginatedNewsEntity.totalData));
      }
    } catch (e) {
      log('News load error: ', error: e);
      emit(NewsError(
          message:
              'Unable to refresh data. Make sure you are connected to Internet.'));
    }
  }

  getMoreNews() async {
    final currentState = state;
    if (currentState is NewsLoadingMore) return;
    emit(NewsLoadingMore());
    try {
      final PaginatedNewsEntity paginatedNewsEntity = await getNewsUseCase.call(
        GetNewsUseCaseParams(page),
      );
      if (paginatedNewsEntity == null ||
          paginatedNewsEntity.data == null ||
          paginatedNewsEntity.data.isEmpty) {
        if (currentState is NewsLoadSuccess) {
          emit(currentState.copyWith(hasMore: false));
        } else
          emit(NewsLoadEmpty(message: 'News data not available.'));
      } else {
        _page += 1;
        if (currentState is NewsLoadSuccess) {
          emit(currentState.copyWith(
              news: currentState.news + paginatedNewsEntity.data,
              hasMore: (paginatedNewsEntity.page * paginatedNewsEntity.size) <
                  paginatedNewsEntity.totalData));
        } else {
          emit(NewsLoadSuccess(paginatedNewsEntity.data,
              hasMore: (paginatedNewsEntity.page * paginatedNewsEntity.size) <
                  paginatedNewsEntity.totalData));
        }
      }
    } catch (e) {
      log('News load more error: ', error: e);
      if (currentState is NewsLoadSuccess) {
        emit(currentState.copyWith(hasMore: false));
      } else
        emit(NewsError(
            message:
                'Unable to load more data. Make sure you are connected to Internet.'));
    }
  }
}
