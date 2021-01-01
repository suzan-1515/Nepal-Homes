import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:nepal_homes/core/models/nullable.dart';
import 'package:nepal_homes/core/usecases/usecase.dart';
import 'package:nepal_homes/feature_property_listing/domain/entities/property_category_entity.dart';
import 'package:nepal_homes/feature_property_listing/domain/entities/property_filter_entity.dart';
import 'package:nepal_homes/feature_property_listing/domain/entities/property_meta_entity.dart';
import 'package:nepal_homes/feature_property_listing/domain/entities/property_query.dart';
import 'package:nepal_homes/feature_property_listing/domain/usecases/get_property_meta_use_case.dart';
import 'package:nepal_homes/feature_property_listing/presentation/extensions/property_extensions.dart';

part 'property_filter_state.dart';

class PropertyFilterCubit extends Cubit<PropertyFilterState> {
  final GetPropertyMetaUseCase getPropertyMetaUseCase;

  PropertyFilterCubit({@required this.getPropertyMetaUseCase})
      : super(PropertyFilterInitial());

  getMeta({PropertyQuery query}) async {
    if (state is PropertyFilterLoading) return;
    try {
      emit(PropertyFilterLoading());
      PropertyMetaEntity propertyFilterEntity =
          await getPropertyMetaUseCase.call(NoParams());
      if (propertyFilterEntity == null)
        emit(PropertyFilterLoadEmpty(message: 'Unable to load filters.'));
      else {
        var filter = propertyFilterEntity.toFilter;
        if (query != null) {
          filter = filter.copyWith(
            isPremium: Nullable<bool>(query?.isPremium),
            isFeatured: Nullable<bool>(query?.isFeatured),
            propertyCategory: Nullable<PropertyCategoryEntity>(
              filter.propertyMeta.propertyCategories?.firstWhere(
                (element) => element.id == query?.propertyCategoryId,
                orElse: () => null,
              ),
            ),
          );
        }
        emit(PropertyFilterLoadSuccess(propertyFilter: filter));
      }
    } catch (e) {
      log('Property meta load error: ', error: e);
      emit(PropertyFilterLoadError(
          message:
              'Unable to load filters. Make sure you are connected to Internet.'));
    }
  }

  updateFilter({PropertyQuery query}) {
    final currentState = state;
    if (currentState is PropertyFilterLoadSuccess) {
      emit(
        PropertyFilterLoadSuccess(
          propertyFilter: PropertyFilterEntity(
            propertyMeta: currentState.propertyFilter.propertyMeta,
            isPremium: query?.isPremium,
            isFeatured: query?.isFeatured,
            propertyCategory: currentState
                .propertyFilter.propertyMeta.propertyCategories
                ?.firstWhere(
              (element) => element.id == query?.propertyCategoryId,
              orElse: () => null,
            ),
          ),
        ),
      );
    }
  }

  applyFilter({@required PropertyFilterEntity propertyFilter}) {
    emit(PropertyFilterLoadSuccess(propertyFilter: propertyFilter));
  }

  resetFilter({@required PropertyFilterEntity propertyFilter}) {
    emit(PropertyFilterLoading());
    emit(PropertyFilterLoadSuccess(propertyFilter: propertyFilter));
  }
}
