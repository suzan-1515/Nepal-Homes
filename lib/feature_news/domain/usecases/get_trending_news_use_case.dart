import 'dart:developer';

import 'package:nepal_homes/core/usecases/usecase.dart';
import 'package:nepal_homes/feature_news/domain/entities/news_entity.dart';
import 'package:nepal_homes/feature_news/domain/repositories/repository.dart';

class GetTrendingNewsUseCase implements UseCase<PaginatedNewsEntity, NoParams> {
  final Repository _repository;

  GetTrendingNewsUseCase(this._repository);

  @override
  Future<PaginatedNewsEntity> call(NoParams params) {
    try {
      return this._repository.getTrendingNews();
    } catch (e) {
      log('GetTrendingNewsUseCase unsuccessful.', error: e);
      throw e;
    }
  }
}
