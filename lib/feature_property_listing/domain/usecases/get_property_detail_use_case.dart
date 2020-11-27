import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:nepal_homes/core/usecases/usecase.dart';
import 'package:nepal_homes/feature_property_listing/domain/entities/property_detail_entity.dart';
import 'package:nepal_homes/feature_property_listing/domain/repositories/repository.dart';

class GetPropertyDetailUseCase
    implements
        UseCase<PropertyDetailWrapperEntity, GetPropertyDetailUseCaseParams> {
  final Repository _repository;

  GetPropertyDetailUseCase(this._repository);

  @override
  Future<PropertyDetailWrapperEntity> call(
      GetPropertyDetailUseCaseParams params) {
    try {
      return this._repository.getPropertyDetail(slug: params.slug);
    } catch (e) {
      log('GetPropertyDetailUseCase unsuccessful.', error: e);
      throw e;
    }
  }
}

class GetPropertyDetailUseCaseParams extends Equatable {
  final String slug;

  GetPropertyDetailUseCaseParams({@required this.slug});

  @override
  List<Object> get props => [slug];
}
