import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:nepal_homes/core/usecases/usecase.dart';
import 'package:nepal_homes/feature_agencies/domain/entities/agency_detail_entity.dart';
import 'package:nepal_homes/feature_agencies/domain/repositories/repository.dart';

class GetAgencyDetailUseCase
    implements
        UseCase<AgencyDetailWrapperEntity, GetAgencyDetailUseCaseParams> {
  final Repository _repository;

  GetAgencyDetailUseCase(this._repository);

  @override
  Future<AgencyDetailWrapperEntity> call(GetAgencyDetailUseCaseParams params) {
    try {
      return this._repository.getAgencyDetail(id: params.id);
    } catch (e) {
      log('GetAgencyDetailUseCase unsuccessful.', error: e);
      throw e;
    }
  }
}

class GetAgencyDetailUseCaseParams extends Equatable {
  final String id;

  GetAgencyDetailUseCaseParams({@required this.id});

  @override
  List<Object> get props => [id];
}
