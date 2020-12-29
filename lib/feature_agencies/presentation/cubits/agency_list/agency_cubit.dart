import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:nepal_homes/core/models/page_config.dart';
import 'package:nepal_homes/feature_agencies/domain/entities/agency_entity.dart';
import 'package:nepal_homes/feature_agencies/domain/usecases/usecases.dart';
import 'package:nepal_homes/feature_agencies/presentation/extensions/agency_extensions.dart';
import 'package:nepal_homes/feature_agencies/presentation/models/agency_model.dart';

part 'agency_state.dart';

class AgencyCubit extends Cubit<AgencyState> {
  final GetAgenciesUseCase getAgenciesUseCase;
  final GetAgencyDetailUseCase getAgencyDetailUseCase;

  AgencyCubit(
      {@required this.getAgenciesUseCase,
      @required this.getAgencyDetailUseCase})
      : super(AgencyInitial());

  int _page = 1;

  int get page => this._page;

  getAgencies() async {
    if (state is AgencyLoading) return;
    emit(AgencyLoading());
    try {
      _page = 1;
      final PaginatedAgencyEntity paginatedAgencyEntity =
          await getAgenciesUseCase.call(
        GetAgenciesUseCaseParams(PageConfig(page: page)),
      );
      if (paginatedAgencyEntity == null ||
          paginatedAgencyEntity.agencies == null ||
          paginatedAgencyEntity.agencies.isEmpty)
        emit(AgencyLoadEmpty(message: 'Agency data not available.'));
      else
        emit(AgencyLoadSuccess(paginatedAgencyEntity.agencies.toUIModel,
            hasMore: (paginatedAgencyEntity.page * paginatedAgencyEntity.size) <
                paginatedAgencyEntity.totaldata));
    } catch (e) {
      log('Agencies load error: ', error: e);
      emit(AgencyLoadError(
          message:
              'Unable to load agency data. Make sure you are connected to Internet.'));
    }
  }

  refreshAgencies() async {
    if (state is AgencyLoading) return;
    try {
      final PaginatedAgencyEntity paginatedAgencyEntity =
          await getAgenciesUseCase.call(
        GetAgenciesUseCaseParams(PageConfig(page: 1)),
      );
      if (paginatedAgencyEntity == null ||
          paginatedAgencyEntity.agencies == null ||
          paginatedAgencyEntity.agencies.isEmpty) {
        if (state is AgencyLoadSuccess) {
          emit(AgencyError(message: 'Unable to refresh data.'));
        } else
          emit(AgencyLoadEmpty(message: 'Agency data not available.'));
      } else {
        _page = 1;
        emit(AgencyLoadSuccess(paginatedAgencyEntity.agencies.toUIModel,
            hasMore: (paginatedAgencyEntity.page * paginatedAgencyEntity.size) <
                paginatedAgencyEntity.totaldata));
      }
    } catch (e) {
      log('Agencies load error: ', error: e);
      emit(AgencyError(
          message:
              'Unable to refresh data. Make sure you are connected to Internet.'));
    }
  }

  getMoreAgencies() async {
    final currentState = state;
    if (currentState is AgencyLoadingMore) return;
    emit(AgencyLoadingMore());
    try {
      final PaginatedAgencyEntity paginatedAgencyEntity =
          await getAgenciesUseCase.call(
        GetAgenciesUseCaseParams(PageConfig(page: page + 1)),
      );
      if (paginatedAgencyEntity == null ||
          paginatedAgencyEntity.agencies == null ||
          paginatedAgencyEntity.agencies.isEmpty) {
        if (currentState is AgencyLoadSuccess) {
          emit(currentState.copyWith(hasMore: false));
        } else
          emit(AgencyLoadEmpty(message: 'Agency data not available.'));
      } else {
        _page += 1;
        if (currentState is AgencyLoadSuccess) {
          emit(currentState.copyWith(
              agencies: currentState.agencies +
                  paginatedAgencyEntity.agencies.toUIModel,
              hasMore:
                  (paginatedAgencyEntity.page * paginatedAgencyEntity.size) <
                      paginatedAgencyEntity.totaldata));
        } else {
          emit(AgencyLoadSuccess(paginatedAgencyEntity.agencies.toUIModel,
              hasMore:
                  (paginatedAgencyEntity.page * paginatedAgencyEntity.size) <
                      paginatedAgencyEntity.totaldata));
        }
      }
    } catch (e) {
      log('Agencies load more error: ', error: e);
      if (currentState is AgencyLoadSuccess) {
        emit(currentState.copyWith(hasMore: false));
      } else
        emit(AgencyError(
            message:
                'Unable to load more data. Make sure you are connected to Internet.'));
    }
  }
}
