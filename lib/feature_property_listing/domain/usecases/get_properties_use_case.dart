import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:nepal_homes/core/usecases/usecase.dart';
import 'package:nepal_homes/feature_property_listing/domain/entities/property_entity.dart';
import 'package:nepal_homes/feature_property_listing/domain/entities/property_query.dart';
import 'package:nepal_homes/feature_property_listing/domain/repositories/repository.dart';

class GetPropertiesUseCase
    implements UseCase<PaginatedPropertyEntity, GetPropertiesUseCaseParams> {
  final Repository _repository;

  GetPropertiesUseCase(this._repository);

  @override
  Future<PaginatedPropertyEntity> call(GetPropertiesUseCaseParams params) {
    try {
      return this._repository.getProperties(query: params.query);
    } catch (e) {
      log('GetPropertiesUseCase unsuccessful.', error: e);
      throw e;
    }
  }
}

class GetPropertiesUseCaseParams extends Equatable {
  final PropertyQuery query;

  GetPropertiesUseCaseParams(this.query);

  @override
  List<Object> get props => [query];
}
