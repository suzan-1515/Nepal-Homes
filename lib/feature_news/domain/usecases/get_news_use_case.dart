import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:nepal_homes/core/usecases/usecase.dart';
import 'package:nepal_homes/feature_news/domain/entities/news_entity.dart';
import 'package:nepal_homes/feature_news/domain/repositories/repository.dart';

class GetNewsUseCase
    implements UseCase<PaginatedNewsEntity, GetNewsUseCaseParams> {
  final Repository _repository;

  GetNewsUseCase(this._repository);

  @override
  Future<PaginatedNewsEntity> call(GetNewsUseCaseParams params) {
    try {
      return this._repository.getNews(page: params.page);
    } catch (e) {
      log('GetNewsUseCase unsuccessful.', error: e);
      throw e;
    }
  }
}

class GetNewsUseCaseParams extends Equatable {
  final int page;

  GetNewsUseCaseParams(this.page);

  @override
  List<Object> get props => [page];
}
