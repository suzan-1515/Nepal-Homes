import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:nepal_homes/core/models/page_config.dart';
import 'package:nepal_homes/core/usecases/usecase.dart';
import 'package:nepal_homes/feature_agencies/domain/entities/agency_entity.dart';
import 'package:nepal_homes/feature_agencies/domain/repositories/repository.dart';

class GetAgenciesUseCase
    implements UseCase<PaginatedAgencyEntity, GetAgenciesUseCaseParams> {
  final Repository _repository;

  GetAgenciesUseCase(this._repository);

  @override
  Future<PaginatedAgencyEntity> call(GetAgenciesUseCaseParams params) {
    try {
      return this._repository.getAgencies(pageConfig: params.pageConfig);
    } catch (e) {
      log('GetAgenciesUseCase unsuccessful.', error: e);
      throw e;
    }
  }
}

class GetAgenciesUseCaseParams extends Equatable {
  final PageConfig pageConfig;

  GetAgenciesUseCaseParams(this.pageConfig);

  @override
  List<Object> get props => [pageConfig];
}
