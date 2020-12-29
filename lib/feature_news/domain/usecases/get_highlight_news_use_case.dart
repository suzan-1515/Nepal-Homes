import 'dart:developer';

import 'package:nepal_homes/core/usecases/usecase.dart';
import 'package:nepal_homes/feature_news/domain/entities/news_entity.dart';
import 'package:nepal_homes/feature_news/domain/repositories/repository.dart';

class GetHighlightNewsUseCase
    implements UseCase<PaginatedNewsEntity, NoParams> {
  final Repository _repository;

  GetHighlightNewsUseCase(this._repository);

  @override
  Future<PaginatedNewsEntity> call(NoParams params) {
    try {
      return this._repository.getHighlightNews();
    } catch (e) {
      log('GetHighlightNewsUseCase unsuccessful.', error: e);
      throw e;
    }
  }
}
