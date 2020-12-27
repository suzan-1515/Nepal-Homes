import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:nepal_homes/core/usecases/usecase.dart';
import 'package:nepal_homes/feature_property_listing/domain/entities/property_entity.dart';
import 'package:nepal_homes/feature_property_listing/domain/usecases/usecases.dart';

part 'recent_property_state.dart';

class RecentPropertyCubit extends Cubit<RecentPropertyState> {
  final GetRecentPropertiesUseCase getRecentPropertiesUseCase;
  RecentPropertyCubit({@required this.getRecentPropertiesUseCase})
      : super(RecentPropertyInitial());

  getProperties() async {
    if (state is RecentPropertyLoading) return;
    emit(RecentPropertyLoading());
    try {
      final PaginatedPropertyEntity recentPropertyEntity =
          await getRecentPropertiesUseCase.call(NoParams());
      if (recentPropertyEntity == null ||
          recentPropertyEntity.data == null ||
          recentPropertyEntity.data.isEmpty)
        emit(RecentPropertyLoadEmpty(message: 'Property data not available.'));
      else
        emit(RecentPropertyLoadSuccess(recentPropertyEntity.data));
    } catch (e) {
      log('Recent properties load error: ', error: e);
      emit(RecentPropertyLoadError(
          message:
              'Unable to load property data. Make sure you are connected to Internet.'));
    }
  }

  refreshProperties() async {
    if (state is RecentPropertyLoading) return;
    try {
      final PaginatedPropertyEntity recentPropertyEntity =
          await getRecentPropertiesUseCase.call(NoParams());
      if (recentPropertyEntity == null ||
          recentPropertyEntity.data == null ||
          recentPropertyEntity.data.isEmpty) {
        if (state is RecentPropertyLoadSuccess) {
          emit(RecentPropertyError(message: 'Unable to refresh data.'));
        } else
          emit(RecentPropertyLoadEmpty(
              message: 'RecentProperty data not available.'));
      } else {
        emit(RecentPropertyLoading());
        emit(RecentPropertyLoadSuccess(recentPropertyEntity.data));
      }
    } catch (e) {
      log('Recent properties refresh error: ', error: e);
      emit(RecentPropertyError(
          message:
              'Unable to refresh data. Make sure you are connected to Internet.'));
    }
  }
}
