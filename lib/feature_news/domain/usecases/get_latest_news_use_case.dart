import 'dart:developer';

import 'package:nepal_homes/core/usecases/usecase.dart';
import 'package:nepal_homes/feature_news/domain/entities/news_entity.dart';
import 'package:nepal_homes/feature_news/domain/repositories/repository.dart';

class GetLatestNewsUseCase implements UseCase<PaginatedNewsEntity, NoParams> {
  final Repository _repository;

  GetLatestNewsUseCase(this._repository);

  @override
  Future<PaginatedNewsEntity> call(NoParams params) {
    try {
      return this._repository.getLatestNews();
    } catch (e) {
      log('GetLatestNewsUseCase unsuccessful.', error: e);
      throw e;
    }
  }
}
