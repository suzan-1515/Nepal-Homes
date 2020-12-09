import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:nepal_homes/core/models/nullable.dart';
import 'package:nepal_homes/feature_property_listing/domain/entities/property_entity.dart';
import 'package:nepal_homes/feature_property_listing/domain/entities/property_filter_entity.dart';
import 'package:nepal_homes/feature_property_listing/domain/entities/property_query.dart';
import 'package:nepal_homes/feature_property_listing/domain/usecases/usecases.dart';
import 'package:nepal_homes/feature_property_listing/presentation/extensions/property_extensions.dart';
import 'package:nepal_homes/feature_property_listing/presentation/models/property_model.dart';

part 'property_state.dart';

class PropertyCubit extends Cubit<PropertyState> {
  final GetPropertiesUseCase getPropertiesUseCase;
  PropertyCubit({@required this.getPropertiesUseCase})
      : super(PropertyInitial());

  int _page = 1;
  int get page => this._page;

  getProperties({PropertyQuery query}) async {
    if (state is PropertyLoading) return;
    emit(PropertyLoading());
    try {
      _page = 1;
      final PaginatedPropertyEntity paginatedPropertyEntity =
          await getPropertiesUseCase.call(
        GetPropertiesUseCaseParams(query.copyWith(page: Nullable<int>(_page))),
      );
      if (paginatedPropertyEntity == null ||
          paginatedPropertyEntity.data == null ||
          paginatedPropertyEntity.data.isEmpty)
        emit(PropertyLoadEmpty(message: 'Property data not available.'));
      else
        emit(PropertyLoadSuccess(paginatedPropertyEntity.data.toUIModel,
            hasMore:
                (paginatedPropertyEntity.page * paginatedPropertyEntity.size) <
                    paginatedPropertyEntity.totaldata));
    } catch (e) {
      log('Properties load error: ', error: e);
      emit(PropertyLoadError(
          message:
              'Unable to load property data. Make sure you are connected to Internet.'));
    }
  }

  refreshProperties({PropertyQuery query}) async {
    if (state is PropertyLoading) return;
    try {
      final PaginatedPropertyEntity paginatedPropertyEntity =
          await getPropertiesUseCase.call(
        GetPropertiesUseCaseParams(query.copyWith(page: Nullable<int>(_page))),
      );
      if (paginatedPropertyEntity == null ||
          paginatedPropertyEntity.data == null ||
          paginatedPropertyEntity.data.isEmpty) {
        if (state is PropertyLoadSuccess) {
          emit(PropertyError(message: 'Unable to refresh data.'));
        } else
          emit(PropertyLoadEmpty(message: 'Property data not available.'));
      } else {
        _page = 1;
        emit(PropertyLoadSuccess(paginatedPropertyEntity.data.toUIModel,
            hasMore:
                (paginatedPropertyEntity.page * paginatedPropertyEntity.size) <
                    paginatedPropertyEntity.totaldata));
      }
    } catch (e) {
      log('Properties refresh error: ', error: e);
      emit(PropertyError(
          message:
              'Unable to refresh data. Make sure you are connected to Internet.'));
    }
  }

  getMoreProperties({PropertyQuery query}) async {
    final currentState = state;
    if (currentState is PropertyLoadingMore) return;
    emit(PropertyLoadingMore());
    try {
      final PaginatedPropertyEntity paginatedPropertyEntity =
          await getPropertiesUseCase.call(
        GetPropertiesUseCaseParams(
            query.copyWith(page: Nullable<int>(_page + 1))),
      );
      if (paginatedPropertyEntity == null ||
          paginatedPropertyEntity.data == null ||
          paginatedPropertyEntity.data.isEmpty) {
        if (currentState is PropertyLoadSuccess) {
          emit(currentState.copyWith(hasMore: false));
        } else
          emit(PropertyLoadEmpty(message: 'Property data not available.'));
      } else {
        _page += 1;
        if (currentState is PropertyLoadSuccess) {
          emit(currentState.copyWith(
              properties: currentState.properties +
                  paginatedPropertyEntity.data.toUIModel,
              hasMore: (paginatedPropertyEntity.page *
                      paginatedPropertyEntity.size) <
                  paginatedPropertyEntity.totaldata));
        } else {
          emit(PropertyLoadSuccess(paginatedPropertyEntity.data.toUIModel,
              hasMore: (paginatedPropertyEntity.page *
                      paginatedPropertyEntity.size) <
                  paginatedPropertyEntity.totaldata));
        }
      }
    } catch (e) {
      log('Properties load more error: ', error: e);
      if (currentState is PropertyLoadSuccess) {
        emit(currentState.copyWith(hasMore: false));
      } else
        emit(PropertyError(
            message:
                'Unable to load more data. Make sure you are connected to Internet.'));
    }
  }

  updateFilter({@required PropertyFilterEntity propertyFilter}) {
    emit(PropertyFilterChanged(filter: propertyFilter));
  }
}
