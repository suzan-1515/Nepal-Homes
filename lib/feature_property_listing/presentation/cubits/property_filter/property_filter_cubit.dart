import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:nepal_homes/core/usecases/usecase.dart';
import 'package:nepal_homes/feature_property_listing/domain/entities/property_filter_entity.dart';
import 'package:nepal_homes/feature_property_listing/domain/entities/property_meta_entity.dart';
import 'package:nepal_homes/feature_property_listing/domain/usecases/get_property_meta_use_case.dart';
import 'package:nepal_homes/feature_property_listing/presentation/extensions/property_extensions.dart';

part 'property_filter_state.dart';

class PropertyFilterCubit extends Cubit<PropertyFilterState> {
  final GetPropertyMetaUseCase getPropertyMetaUseCase;
  PropertyFilterCubit({@required this.getPropertyMetaUseCase})
      : super(PropertyFilterInitial());

  getMeta() async {
    if (state is PropertyFilterLoading) return;
    try {
      emit(PropertyFilterLoading());
      PropertyMetaEntity propertyFilterEntity =
          await getPropertyMetaUseCase.call(NoParams());
      if (propertyFilterEntity == null)
        emit(PropertyFilterLoadEmpty(message: 'Unable to load filters.'));
      else
        emit(PropertyFilterLoadSuccess(
            propertyFilter: propertyFilterEntity.toFilter));
    } catch (e) {
      log('Property meta load error: ', error: e);
      emit(PropertyFilterLoadError(
          message:
              'Unable to load filters. Make sure you are connected to Internet.'));
    }
  }

  applyFilter({@required PropertyFilterEntity propertyFilter}) {
    emit(PropertyFilterChanged(filter: propertyFilter));
  }
}
