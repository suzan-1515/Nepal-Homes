import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:nepal_homes/core/usecases/usecase.dart';
import 'package:nepal_homes/feature_news/domain/entities/news_entity.dart';
import 'package:nepal_homes/feature_news/domain/usecases/usecases.dart';

part 'latest_news_state.dart';

class LatestNewsCubit extends Cubit<LatestNewsState> {
  final GetLatestNewsUseCase getLatestNewsUseCase;

  LatestNewsCubit({
    @required this.getLatestNewsUseCase,
  }) : super(LatestNewsInitial());

  getNews() async {
    if (state is LatestNewsLoading) return;
    emit(LatestNewsLoading());
    try {
      final PaginatedNewsEntity paginatedNewsEntity =
          await getLatestNewsUseCase.call(NoParams());
      if (paginatedNewsEntity == null ||
          paginatedNewsEntity.data == null ||
          paginatedNewsEntity.data.isEmpty)
        emit(LatestNewsLoadEmpty(message: 'News data not available.'));
      else
        emit(LatestNewsLoadSuccess(paginatedNewsEntity.data));
    } catch (e) {
      log('Latest news load error: ', error: e);
      emit(LatestNewsLoadError(
          message:
              'Unable to load news data. Make sure you are connected to Internet.'));
    }
  }

  refreshNews() async {
    if (state is LatestNewsLoading) return;
    try {
      final PaginatedNewsEntity paginatedNewsEntity =
          await getLatestNewsUseCase.call(NoParams());
      if (paginatedNewsEntity == null ||
          paginatedNewsEntity.data == null ||
          paginatedNewsEntity.data.isEmpty) {
        if (state is LatestNewsLoadSuccess) {
          emit(LatestNewsError(message: 'Unable to refresh data.'));
        } else
          emit(LatestNewsLoadEmpty(message: 'News data not available.'));
      } else {
        emit(LatestNewsLoadSuccess(paginatedNewsEntity.data));
      }
    } catch (e) {
      log('Latest news load error: ', error: e);
      emit(LatestNewsError(
          message:
              'Unable to refresh data. Make sure you are connected to Internet.'));
    }
  }
}
