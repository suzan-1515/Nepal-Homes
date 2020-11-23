import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:nepal_homes/core/usecases/usecase.dart';
import 'package:nepal_homes/feature_agencies/domain/entities/agency_detail_entity.dart';
import 'package:nepal_homes/feature_agencies/domain/usecases/get_agency_detail_use_case.dart';

part 'agency_detail_state.dart';

class AgencyDetailCubit extends Cubit<AgencyDetailState> {
  final UseCase getAgencyDetailUseCase;
  AgencyDetailCubit({@required this.getAgencyDetailUseCase})
      : super(AgencyDetailInitial());

  getDetail({@required String id}) async {
    if (state is AgencyDetailLoading) return;
    emit(AgencyDetailLoading());
    try {
      final AgencyDetailWrapperEntity entity = await getAgencyDetailUseCase(
        GetAgencyDetailUseCaseParams(id: id),
      );
      if (entity == null)
        emit(AgencyDetailLoadEmpty(message: 'Unable to load data.'));
      else
        emit(AgencyDetailLoadSuccess(agencyDetailEntity: entity.data));
    } catch (e) {
      log('Agency detail load error: ', error: e);
      emit(AgencyDetailLoadError(
          message:
              'Unable to load data. Make sure you are connected to Internet.'));
    }
  }
}
