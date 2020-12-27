import 'dart:developer';

import 'package:nepal_homes/core/usecases/usecase.dart';
import 'package:nepal_homes/feature_property_listing/domain/entities/featured_property_entity.dart';
import 'package:nepal_homes/feature_property_listing/domain/repositories/repository.dart';

class GetFeaturedPropertiesUseCase
    implements UseCase<FeaturedPropertyEntity, NoParams> {
  final Repository _repository;

  GetFeaturedPropertiesUseCase(this._repository);

  @override
  Future<FeaturedPropertyEntity> call(NoParams params) {
    try {
      return this._repository.getFeaturedProperties();
    } catch (e) {
      log('GetFeaturedPropertiesUseCase unsuccessful.', error: e);
      throw e;
    }
  }
}
