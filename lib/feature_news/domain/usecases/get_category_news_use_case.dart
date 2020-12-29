import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:nepal_homes/core/usecases/usecase.dart';
import 'package:nepal_homes/feature_news/domain/entities/news_entity.dart';
import 'package:nepal_homes/feature_news/domain/repositories/repository.dart';

class GetCategoryNewsUseCase
    implements UseCase<PaginatedNewsEntity, GetCategoryNewsUseCaseParams> {
  final Repository _repository;

  GetCategoryNewsUseCase(this._repository);

  @override
  Future<PaginatedNewsEntity> call(GetCategoryNewsUseCaseParams params) {
    try {
      return this
          ._repository
          .getCategoryNews(page: params.page, slug: params.slug);
    } catch (e) {
      log('GetCategoryNewsUseCase unsuccessful.', error: e);
      throw e;
    }
  }
}

class GetCategoryNewsUseCaseParams extends Equatable {
  final int page;
  final String slug;

  GetCategoryNewsUseCaseParams({@required this.page, @required this.slug});

  @override
  List<Object> get props => [page, slug];
}
