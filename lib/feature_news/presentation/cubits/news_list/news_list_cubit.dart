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
  }) : super(NewsLoading());

  updateHighlightNews(List<NewsEntity> news) async {
    final currentState = state;
    if (currentState is NewsLoading) {
      emit(NewsLoadSuccess(highlightNews: news));
    } else if (currentState is NewsLoadSuccess) {
      emit(currentState.copyWith(highlightNews: news));
    }
  }

  updateShowcaseNews(List<NewsEntity> news) async {
    final currentState = state;
    if (currentState is NewsLoading) {
      emit(NewsLoadSuccess(showcaseNews: news));
    } else if (currentState is NewsLoadSuccess) {
      emit(currentState.copyWith(showcaseNews: news));
    }
  }

  updateTrendingNews(List<NewsEntity> news) async {
    final currentState = state;
    if (currentState is NewsLoading) {
      emit(NewsLoadSuccess(trendingNews: news));
    } else if (currentState is NewsLoadSuccess) {
      emit(currentState.copyWith(trendingNews: news));
    }
  }
}
