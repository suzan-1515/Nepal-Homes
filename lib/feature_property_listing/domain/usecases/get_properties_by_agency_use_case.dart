import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:nepal_homes/core/usecases/usecase.dart';
import 'package:nepal_homes/feature_property_listing/domain/entities/property_entity.dart';
import 'package:nepal_homes/feature_property_listing/domain/entities/property_query.dart';
import 'package:nepal_homes/feature_property_listing/domain/repositories/repository.dart';

class GetPropertiesByAgencyUseCase
    implements
        UseCase<PaginatedPropertyEntity, GetPropertiesByAgencyUseCaseParams> {
  final Repository _repository;

  GetPropertiesByAgencyUseCase(this._repository);

  @override
  Future<PaginatedPropertyEntity> call(
      GetPropertiesByAgencyUseCaseParams params) {
    try {
      return this._repository.getProperties(query: params.query);
    } catch (e) {
      log('GetPropertiesByAgencyUseCase unsuccessful.', error: e);
      throw e;
    }
  }
}

class GetPropertiesByAgencyUseCaseParams extends Equatable {
  final PropertyQuery query;

  GetPropertiesByAgencyUseCaseParams(this.query);

  @override
  List<Object> get props => [query];
}
