import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:nepal_homes/core/usecases/usecase.dart';
import 'package:nepal_homes/feature_property_listing/domain/entities/featured_property_entity.dart';
import 'package:nepal_homes/feature_property_listing/domain/entities/property_entity.dart';
import 'package:nepal_homes/feature_property_listing/domain/usecases/usecases.dart';

part 'featured_property_state.dart';

class FeaturedPropertyCubit extends Cubit<FeaturedPropertyState> {
  final GetFeaturedPropertiesUseCase getFeaturedPropertiesUseCase;
  FeaturedPropertyCubit({@required this.getFeaturedPropertiesUseCase})
      : super(FeaturedPropertyInitial());

  getProperties() async {
    if (state is FeaturedPropertyLoading) return;
    emit(FeaturedPropertyLoading());
    try {
      final FeaturedPropertyEntity featuredPropertyEntity =
          await getFeaturedPropertiesUseCase.call(NoParams());
      if (featuredPropertyEntity == null ||
          featuredPropertyEntity.properties == null ||
          featuredPropertyEntity.properties.isEmpty)
        emit(
            FeaturedPropertyLoadEmpty(message: 'Property data not available.'));
      else
        emit(FeaturedPropertyLoadSuccess(featuredPropertyEntity.properties));
    } catch (e) {
      log('Featured properties load error: ', error: e);
      emit(FeaturedPropertyLoadError(
          message:
              'Unable to load property data. Make sure you are connected to Internet.'));
    }
  }

  refreshProperties() async {
    if (state is FeaturedPropertyLoading) return;
    try {
      final FeaturedPropertyEntity featuredPropertyEntity =
          await getFeaturedPropertiesUseCase.call(NoParams());
      if (featuredPropertyEntity == null ||
          featuredPropertyEntity.properties == null ||
          featuredPropertyEntity.properties.isEmpty) {
        if (state is FeaturedPropertyLoadSuccess) {
          emit(FeaturedPropertyError(message: 'Unable to refresh data.'));
        } else
          emit(FeaturedPropertyLoadEmpty(
              message: 'FeaturedProperty data not available.'));
      } else {
        emit(FeaturedPropertyLoading());
        emit(FeaturedPropertyLoadSuccess(featuredPropertyEntity.properties));
      }
    } catch (e) {
      log('Featured properties refresh error: ', error: e);
      emit(FeaturedPropertyError(
          message:
              'Unable to refresh data. Make sure you are connected to Internet.'));
    }
  }
}
