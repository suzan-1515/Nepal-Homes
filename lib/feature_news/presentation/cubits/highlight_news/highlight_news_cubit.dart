import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:nepal_homes/core/usecases/usecase.dart';
import 'package:nepal_homes/feature_news/domain/entities/news_entity.dart';
import 'package:nepal_homes/feature_news/domain/usecases/usecases.dart';

part 'highlight_news_state.dart';

class HighlightNewsCubit extends Cubit<HighlightNewsState> {
  final GetHighlightNewsUseCase getHighlightNewsUseCase;

  HighlightNewsCubit({
    @required this.getHighlightNewsUseCase,
  }) : super(HighlightNewsInitial());

  getNews() async {
    if (state is HighlightNewsLoading) return;
    emit(HighlightNewsLoading());
    try {
      final PaginatedNewsEntity paginatedNewsEntity =
          await getHighlightNewsUseCase.call(NoParams());
      if (paginatedNewsEntity == null ||
          paginatedNewsEntity.data == null ||
          paginatedNewsEntity.data.isEmpty)
        emit(HighlightNewsLoadEmpty(message: 'News data not available.'));
      else
        emit(HighlightNewsLoadSuccess(paginatedNewsEntity.data));
    } catch (e) {
      log('Highlight news load error: ', error: e);
      emit(HighlightNewsLoadError(
          message:
              'Unable to load news data. Make sure you are connected to Internet.'));
    }
  }

  refreshNews() async {
    if (state is HighlightNewsLoading) return;
    try {
      final PaginatedNewsEntity paginatedNewsEntity =
          await getHighlightNewsUseCase.call(NoParams());
      if (paginatedNewsEntity == null ||
          paginatedNewsEntity.data == null ||
          paginatedNewsEntity.data.isEmpty) {
        if (state is HighlightNewsLoadSuccess) {
          emit(HighlightNewsError(message: 'Unable to refresh data.'));
        } else
          emit(HighlightNewsLoadEmpty(message: 'News data not available.'));
      } else {
        emit(HighlightNewsLoadSuccess(paginatedNewsEntity.data));
      }
    } catch (e) {
      log('Highlight news load error: ', error: e);
      emit(HighlightNewsError(
          message:
              'Unable to refresh data. Make sure you are connected to Internet.'));
    }
  }
}
