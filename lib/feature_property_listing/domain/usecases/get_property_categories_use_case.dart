import 'dart:developer';

import 'package:nepal_homes/core/usecases/usecase.dart';
import 'package:nepal_homes/feature_property_listing/domain/entities/property_category_entity.dart';
import 'package:nepal_homes/feature_property_listing/domain/entities/property_meta_entity.dart';
import 'package:nepal_homes/feature_property_listing/domain/repositories/repository.dart';

class GetPropertyCategoriesUseCase implements UseCase<List<PropertyCategoryEntity>, NoParams> {
  final Repository _repository;

  GetPropertyCategoriesUseCase(this._repository);

  @override
  Future<List<PropertyCategoryEntity>> call(NoParams params) {
    try {
      return this._repository.getPropertyCategories();
    } catch (e) {
      log('GetPropertyCategoriesUseCase unsuccessful.', error: e);
      throw e;
    }
  }
}
