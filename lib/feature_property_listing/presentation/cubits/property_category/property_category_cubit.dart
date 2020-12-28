import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:nepal_homes/core/usecases/usecase.dart';
import 'package:nepal_homes/feature_property_listing/domain/entities/property_category_entity.dart';
import 'package:nepal_homes/feature_property_listing/domain/usecases/usecases.dart';

part 'property_category_state.dart';

class PropertyCategoryCubit extends Cubit<PropertyCategoryState> {
  final GetPropertyCategoriesUseCase getPropertyCategoriesUseCase;

  PropertyCategoryCubit({@required this.getPropertyCategoriesUseCase})
      : super(PropertyCategoryInitial());

  getCategories() async {
    if (state is PropertyCategoryLoading) return;
    try {
      emit(PropertyCategoryLoading());
      final List<PropertyCategoryEntity> propertyCategoryEntities =
          await getPropertyCategoriesUseCase.call(NoParams());
      if (propertyCategoryEntities == null || propertyCategoryEntities.isEmpty)
        emit(PropertyCategoryLoadEmpty(message: 'Unable to load categories.'));
      else
        emit(PropertyCategoryLoadSuccess(
            propertyCategories: propertyCategoryEntities));
    } catch (e) {
      log('Property category load error: ', error: e);
      emit(PropertyCategoryLoadError(
          message:
              'Unable to load categories. Make sure you are connected to Internet.'));
    }
  }
}
