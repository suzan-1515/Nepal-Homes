import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:nepal_homes/core/usecases/usecase.dart';
import 'package:nepal_homes/feature_news/domain/entities/news_detail_entity.dart';
import 'package:nepal_homes/feature_news/domain/repositories/repository.dart';

class GetNewsDetailUseCase
    implements UseCase<NewsDetailEntity, GetNewsDetailUseCaseParams> {
  final Repository _repository;

  GetNewsDetailUseCase(this._repository);

  @override
  Future<NewsDetailEntity> call(GetNewsDetailUseCaseParams params) {
    try {
      return this._repository.getNewsDetail(id: params.id);
    } catch (e) {
      log('GetNewsDetailUseCase unsuccessful.', error: e);
      throw e;
    }
  }
}

class GetNewsDetailUseCaseParams extends Equatable {
  final String id;

  GetNewsDetailUseCaseParams(this.id);

  @override
  List<Object> get props => [id];
}
