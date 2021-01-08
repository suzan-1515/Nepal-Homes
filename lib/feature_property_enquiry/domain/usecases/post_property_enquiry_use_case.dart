import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:nepal_homes/core/usecases/usecase.dart';
import 'package:nepal_homes/feature_property_enquiry/domain/entities/property_enquiry_request_entity.dart';
import 'package:nepal_homes/feature_property_enquiry/domain/repositories/repository.dart';

class PostPropertyEnquiryUseCase
    implements UseCase<void, PostPropertyEnquiryUseCaseParams> {
  final Repository _repository;

  PostPropertyEnquiryUseCase(this._repository);

  @override
  Future<void> call(PostPropertyEnquiryUseCaseParams params) {
    try {
      return this._repository.postEnquiry(request: params.enquiryRequest);
    } catch (e) {
      log('PostPropertyEnquiryUseCase unsuccessful.', error: e);
      throw e;
    }
  }
}

class PostPropertyEnquiryUseCaseParams extends Equatable {
  final PropertyEnquiryRequestEntity enquiryRequest;

  PostPropertyEnquiryUseCaseParams({
    @required this.enquiryRequest,
  });

  @override
  List<Object> get props => [enquiryRequest];
}
