import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:nepal_homes/core/usecases/usecase.dart';
import 'package:nepal_homes/feature_news/domain/entities/category_entity.dart';
import 'package:nepal_homes/feature_news/domain/repositories/repository.dart';

class GetCategoriesUseCase
    implements UseCase<CategoryWrapperEntity, GetCategoriesUseCaseParams> {
  final Repository _repository;

  GetCategoriesUseCase(this._repository);

  @override
  Future<CategoryWrapperEntity> call(GetCategoriesUseCaseParams params) {
    try {
      return this._repository.getCategories(page: params.page);
    } catch (e) {
      log('GetCategoriesUseCase unsuccessful.', error: e);
      throw e;
    }
  }
}

class GetCategoriesUseCaseParams extends Equatable {
  final int page;

  GetCategoriesUseCaseParams(this.page);

  @override
  List<Object> get props => [page];
}
