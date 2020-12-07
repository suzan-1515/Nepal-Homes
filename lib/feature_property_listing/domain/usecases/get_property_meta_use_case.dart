import 'dart:developer';

import 'package:nepal_homes/core/usecases/usecase.dart';
import 'package:nepal_homes/feature_property_listing/domain/entities/property_meta_entity.dart';
import 'package:nepal_homes/feature_property_listing/domain/repositories/repository.dart';

class GetPropertyMetaUseCase implements UseCase<PropertyMetaEntity, NoParams> {
  final Repository _repository;

  GetPropertyMetaUseCase(this._repository);

  @override
  Future<PropertyMetaEntity> call(NoParams params) {
    try {
      return this._repository.getPropertyMetas();
    } catch (e) {
      log('GetPropertyMetaUseCase unsuccessful.', error: e);
      throw e;
    }
  }
}
