import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:nepal_homes/feature_property_listing/domain/entities/property_detail_entity.dart';
import 'package:nepal_homes/feature_property_listing/domain/usecases/usecases.dart';
import 'package:nepal_homes/feature_property_listing/presentation/extensions/property_extensions.dart';
import 'package:nepal_homes/feature_property_listing/presentation/models/property_detail_model.dart';

part 'property_detail_state.dart';

class PropertyDetailCubit extends Cubit<PropertyDetailState> {
  final GetPropertyDetailUseCase getPropertyDetailUseCase;
  PropertyDetailCubit({@required this.getPropertyDetailUseCase})
      : super(PropertyDetailInitial());

  getDetail({@required String slug}) async {
    if (state is PropertyDetailLoading) return;
    emit(PropertyDetailLoading());
    try {
      final PropertyDetailWrapperEntity entity = await getPropertyDetailUseCase(
        GetPropertyDetailUseCaseParams(slug: slug),
      );
      if (entity == null)
        emit(PropertyDetailLoadEmpty(message: 'Unable to load data.'));
      else
        emit(PropertyDetailLoadSuccess(
            propertyDetailEntity: entity.property,
            relatedProperties: entity.relatedProperties.toUIModel));
    } catch (e) {
      log('Property detail load error: ', error: e);
      emit(PropertyDetailLoadError(
          message:
              'Unable to load data. Make sure you are connected to Internet.'));
    }
  }
}
