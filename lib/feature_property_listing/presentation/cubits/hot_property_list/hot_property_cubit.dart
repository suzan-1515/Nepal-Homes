import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:nepal_homes/core/usecases/usecase.dart';
import 'package:nepal_homes/feature_property_listing/domain/entities/hot_property_entity.dart';
import 'package:nepal_homes/feature_property_listing/domain/entities/property_entity.dart';
import 'package:nepal_homes/feature_property_listing/domain/usecases/usecases.dart';

part 'hot_property_state.dart';

class HotPropertyCubit extends Cubit<HotPropertyState> {
  final GetHotPropertiesUseCase getHotPropertiesUseCase;
  HotPropertyCubit({@required this.getHotPropertiesUseCase})
      : super(HotPropertyInitial());

  getProperties() async {
    if (state is HotPropertyLoading) return;
    emit(HotPropertyLoading());
    try {
      final HotPropertyEntity hotPropertyEntity =
          await getHotPropertiesUseCase.call(NoParams());
      if (hotPropertyEntity == null ||
          hotPropertyEntity.properties == null ||
          hotPropertyEntity.properties.isEmpty)
        emit(HotPropertyLoadEmpty(message: 'Property data not available.'));
      else
        emit(HotPropertyLoadSuccess(hotPropertyEntity.properties));
    } catch (e) {
      log('Hot properties load error: ', error: e);
      emit(HotPropertyLoadError(
          message:
              'Unable to load property data. Make sure you are connected to Internet.'));
    }
  }

  refreshProperties() async {
    if (state is HotPropertyLoading) return;
    try {
      final HotPropertyEntity hotPropertyEntity =
          await getHotPropertiesUseCase.call(NoParams());
      if (hotPropertyEntity == null ||
          hotPropertyEntity.properties == null ||
          hotPropertyEntity.properties.isEmpty) {
        if (state is HotPropertyLoadSuccess) {
          emit(HotPropertyError(message: 'Unable to refresh data.'));
        } else
          emit(
              HotPropertyLoadEmpty(message: 'HotProperty data not available.'));
      } else {
        emit(HotPropertyLoading());
        emit(HotPropertyLoadSuccess(hotPropertyEntity.properties));
      }
    } catch (e) {
      log('Hot properties refresh error: ', error: e);
      emit(HotPropertyError(
          message:
              'Unable to refresh data. Make sure you are connected to Internet.'));
    }
  }
}
