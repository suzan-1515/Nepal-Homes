import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:nepal_homes/core/usecases/usecase.dart';
import 'package:nepal_homes/feature_news/domain/entities/news_entity.dart';
import 'package:nepal_homes/feature_news/domain/repositories/repository.dart';

class GetNewsByAuthorUseCase
    implements UseCase<PaginatedNewsEntity, GetNewsByAuthorUseCaseParams> {
  final Repository _repository;

  GetNewsByAuthorUseCase(this._repository);

  @override
  Future<PaginatedNewsEntity> call(GetNewsByAuthorUseCaseParams params) {
    try {
      return this
          ._repository
          .getNewsByAuthor(authorId: params.authorId, page: params.page);
    } catch (e) {
      log('GetNewsByAuthorUseCase unsuccessful.', error: e);
      throw e;
    }
  }
}

class GetNewsByAuthorUseCaseParams extends Equatable {
  final String authorId;
  final int page;

  GetNewsByAuthorUseCaseParams({@required this.authorId, @required this.page});

  @override
  List<Object> get props => [authorId, page];
}
