import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:nepal_homes/core/usecases/usecase.dart';
import 'package:nepal_homes/feature_news/domain/entities/news_entity.dart';
import 'package:nepal_homes/feature_news/domain/usecases/usecases.dart';

part 'showcase_news_state.dart';

class ShowcaseNewsCubit extends Cubit<ShowcaseNewsState> {
  final GetShowcaseNewsUseCase getShowcaseNewsUseCase;

  ShowcaseNewsCubit({
    @required this.getShowcaseNewsUseCase,
  }) : super(ShowcaseNewsInitial());

  getNews() async {
    if (state is ShowcaseNewsLoading) return;
    emit(ShowcaseNewsLoading());
    try {
      final PaginatedNewsEntity paginatedNewsEntity =
          await getShowcaseNewsUseCase.call(NoParams());
      if (paginatedNewsEntity == null ||
          paginatedNewsEntity.data == null ||
          paginatedNewsEntity.data.isEmpty)
        emit(ShowcaseNewsLoadEmpty(message: 'News data not available.'));
      else
        emit(ShowcaseNewsLoadSuccess(paginatedNewsEntity.data));
    } catch (e) {
      log('Showcase news load error: ', error: e);
      emit(ShowcaseNewsLoadError(
          message:
              'Unable to load news data. Make sure you are connected to Internet.'));
    }
  }

  refreshNews() async {
    if (state is ShowcaseNewsLoading) return;
    try {
      final PaginatedNewsEntity paginatedNewsEntity =
          await getShowcaseNewsUseCase.call(NoParams());
      if (paginatedNewsEntity == null ||
          paginatedNewsEntity.data == null ||
          paginatedNewsEntity.data.isEmpty) {
        if (state is ShowcaseNewsLoadSuccess) {
          emit(ShowcaseNewsError(message: 'Unable to refresh data.'));
        } else
          emit(ShowcaseNewsLoadEmpty(message: 'News data not available.'));
      } else {
        emit(ShowcaseNewsLoadSuccess(paginatedNewsEntity.data));
      }
    } catch (e) {
      log('Showcase news load error: ', error: e);
      emit(ShowcaseNewsError(
          message:
              'Unable to refresh data. Make sure you are connected to Internet.'));
    }
  }
}
