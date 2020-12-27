import 'dart:developer';

import 'package:nepal_homes/core/usecases/usecase.dart';
import 'package:nepal_homes/feature_property_listing/domain/entities/property_entity.dart';
import 'package:nepal_homes/feature_property_listing/domain/repositories/repository.dart';

class GetRecentPropertiesUseCase
    implements UseCase<PaginatedPropertyEntity, NoParams> {
  final Repository _repository;

  GetRecentPropertiesUseCase(this._repository);

  @override
  Future<PaginatedPropertyEntity> call(NoParams params) {
    try {
      return this._repository.getRecentProperties();
    } catch (e) {
      log('GetRecentPropertiesUseCase unsuccessful.', error: e);
      throw e;
    }
  }
}
