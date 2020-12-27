import 'dart:developer';

import 'package:nepal_homes/core/usecases/usecase.dart';
import 'package:nepal_homes/feature_property_listing/domain/entities/hot_property_entity.dart';
import 'package:nepal_homes/feature_property_listing/domain/repositories/repository.dart';

class GetHotPropertiesUseCase implements UseCase<HotPropertyEntity, NoParams> {
  final Repository _repository;

  GetHotPropertiesUseCase(this._repository);

  @override
  Future<HotPropertyEntity> call(NoParams params) {
    try {
      return this._repository.getHotProperties();
    } catch (e) {
      log('GetHotPropertiesUseCase unsuccessful.', error: e);
      throw e;
    }
  }
}
