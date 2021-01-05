import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:nepal_homes/core/usecases/usecase.dart';
import 'package:nepal_homes/feature_news/domain/entities/news_entity.dart';
import 'package:nepal_homes/feature_news/domain/repositories/repository.dart';

class GetRelatedNewsUseCase
    implements UseCase<PaginatedNewsEntity, GetRelatedNewsUseCaseParams> {
  final Repository _repository;

  GetRelatedNewsUseCase(this._repository);

  @override
  Future<PaginatedNewsEntity> call(GetRelatedNewsUseCaseParams params) {
    try {
      return this._repository.getRelatedNews(newsId: params.newsId);
    } catch (e) {
      log('GetRelatedNewsUseCase unsuccessful.', error: e);
      throw e;
    }
  }
}

class GetRelatedNewsUseCaseParams extends Equatable {
  final String newsId;

  GetRelatedNewsUseCaseParams({@required this.newsId});

  @override
  List<Object> get props => [newsId];
}
