import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:nepal_homes/feature_news/domain/entities/news_detail_entity.dart';
import 'package:nepal_homes/feature_news/domain/usecases/usecases.dart';

part 'news_detail_state.dart';

class NewsDetailCubit extends Cubit<NewsDetailState> {
  final GetNewsDetailUseCase getNewsDetailUseCase;

  NewsDetailCubit({
    @required this.getNewsDetailUseCase,
  }) : super(NewsDetailInitial());

  getNewsDetail({@required String id}) async {
    if (state is NewsDetailLoading) return;
    emit(NewsDetailLoading());
    try {
      final NewsDetailEntity newsDetailEntity = await getNewsDetailUseCase.call(
        GetNewsDetailUseCaseParams(id),
      );
      if (newsDetailEntity == null || newsDetailEntity.data == null)
        emit(NewsDetailLoadEmpty(message: 'News detail data not available.'));
      else
        emit(NewsDetailLoadSuccess(newsDetailEntity));
    } catch (e) {
      log('NewsDetail load error: ', error: e);
      emit(NewsDetailLoadError(
          message:
              'Unable to load news data. Make sure you are connected to Internet.'));
    }
  }

  refreshNewsDetail({@required String id}) async {
    if (state is NewsDetailLoading) return;
    try {
      final NewsDetailEntity newsDetailEntity = await getNewsDetailUseCase.call(
        GetNewsDetailUseCaseParams(id),
      );
      if (newsDetailEntity == null || newsDetailEntity.data == null) {
        if (state is NewsDetailLoadSuccess) {
          emit(NewsDetailError(message: 'Unable to refresh data.'));
        } else
          emit(NewsDetailLoadEmpty(message: 'News detail data not available.'));
      } else {
        emit(NewsDetailLoadSuccess(newsDetailEntity));
      }
    } catch (e) {
      log('News detail load error: ', error: e);
      emit(NewsDetailError(
          message:
              'Unable to refresh data. Make sure you are connected to Internet.'));
    }
  }
}
