import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:nepal_homes/feature_news/domain/entities/category_entity.dart';
import 'package:nepal_homes/feature_news/domain/usecases/get_categories_use_case.dart';

part 'news_category_state.dart';

class NewsCategoryCubit extends Cubit<NewsCategoryState> {
  final GetCategoriesUseCase getNewsCategoriesUseCase;

  NewsCategoryCubit({
    @required this.getNewsCategoriesUseCase,
  }) : super(NewsCategoryInitial());

  getCategories() async {
    if (state is NewsCategoryLoading) return;
    emit(NewsCategoryLoading());
    try {
      final CategoryWrapperEntity categoryWrapperEntity =
          await getNewsCategoriesUseCase.call(GetCategoriesUseCaseParams(1));
      if (categoryWrapperEntity == null ||
          categoryWrapperEntity.data == null ||
          categoryWrapperEntity.data.isEmpty)
        emit(NewsCategoryLoadEmpty(message: 'News categories not available.'));
      else
        emit(NewsCategoryLoadSuccess(categoryWrapperEntity.data));
    } catch (e) {
      log('News categories load error: ', error: e);
      emit(NewsCategoryLoadError(
          message:
              'Unable to load news categories. Make sure you are connected to Internet.'));
    }
  }

  refreshCategories() async {
    if (state is NewsCategoryLoading) return;
    try {
      final CategoryWrapperEntity categoryWrapperEntity =
          await getNewsCategoriesUseCase.call(GetCategoriesUseCaseParams(1));
      if (categoryWrapperEntity == null ||
          categoryWrapperEntity.data == null ||
          categoryWrapperEntity.data.isEmpty) {
        if (state is NewsCategoryLoadSuccess) {
          emit(NewsCategoryError(message: 'Unable to refresh data.'));
        } else
          emit(
              NewsCategoryLoadEmpty(message: 'News categories not available.'));
      } else {
        emit(NewsCategoryLoadSuccess(categoryWrapperEntity.data));
      }
    } catch (e) {
      log('News categories load error: ', error: e);
      emit(NewsCategoryError(
          message:
              'Unable to refresh data. Make sure you are connected to Internet.'));
    }
  }
}
