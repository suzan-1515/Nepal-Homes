import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:nepal_homes/feature_news/domain/entities/news_entity.dart';
import 'package:nepal_homes/feature_news/domain/usecases/usecases.dart';

part 'related_news_state.dart';

class RelatedNewsCubit extends Cubit<RelatedNewsState> {
  final GetRelatedNewsUseCase getRelatedNewsUseCase;

  RelatedNewsCubit({
    @required this.getRelatedNewsUseCase,
  }) : super(RelatedNewsInitial());

  getRelatedNews({@required String newsId}) async {
    if (state is RelatedNewsLoading) return;
    emit(RelatedNewsLoading());
    try {
      final PaginatedNewsEntity paginatedNewsEntity =
          await getRelatedNewsUseCase
              .call(GetRelatedNewsUseCaseParams(newsId: newsId));
      if (paginatedNewsEntity == null ||
          paginatedNewsEntity.data == null ||
          paginatedNewsEntity.data.isEmpty)
        emit(RelatedNewsLoadEmpty(message: 'News data not available.'));
      else
        emit(RelatedNewsLoadSuccess(paginatedNewsEntity.data));
    } catch (e) {
      log('Related news load error: ', error: e);
      emit(RelatedNewsLoadError(
          message:
              'Unable to load news data. Make sure you are connected to Internet.'));
    }
  }

  refreshNews({@required String newsId}) async {
    if (state is RelatedNewsLoading) return;
    try {
      final PaginatedNewsEntity paginatedNewsEntity =
          await getRelatedNewsUseCase
              .call(GetRelatedNewsUseCaseParams(newsId: newsId));
      if (paginatedNewsEntity == null ||
          paginatedNewsEntity.data == null ||
          paginatedNewsEntity.data.isEmpty) {
        if (state is RelatedNewsLoadSuccess) {
          emit(RelatedNewsError(message: 'Unable to refresh data.'));
        } else
          emit(RelatedNewsLoadEmpty(message: 'News data not available.'));
      } else {
        emit(RelatedNewsLoadSuccess(paginatedNewsEntity.data));
      }
    } catch (e) {
      log('Related news load error: ', error: e);
      emit(RelatedNewsError(
          message:
              'Unable to refresh data. Make sure you are connected to Internet.'));
    }
  }
}
