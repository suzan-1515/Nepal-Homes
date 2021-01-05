import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:nepal_homes/core/usecases/usecase.dart';
import 'package:nepal_homes/feature_news/domain/entities/news_entity.dart';
import 'package:nepal_homes/feature_news/domain/repositories/repository.dart';

class GetLatestNewsByCategoryUseCase
    implements
        UseCase<PaginatedNewsEntity, GetLatestNewsByCategoryUseCaseParams> {
  final Repository _repository;

  GetLatestNewsByCategoryUseCase(this._repository);

  @override
  Future<PaginatedNewsEntity> call(
      GetLatestNewsByCategoryUseCaseParams params) {
    try {
      return this._repository.getLatestCategoryNews(
          size: params.size, categoryId: params.categoryId);
    } catch (e) {
      log('GetLatestNewsByCategoryUseCase unsuccessful.', error: e);
      throw e;
    }
  }
}

class GetLatestNewsByCategoryUseCaseParams extends Equatable {
  final int size;
  final String categoryId;

  GetLatestNewsByCategoryUseCaseParams(
      {@required this.size, @required this.categoryId});

  @override
  List<Object> get props => [size, categoryId];
}
