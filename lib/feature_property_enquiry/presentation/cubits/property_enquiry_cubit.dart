import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:nepal_homes/feature_property_enquiry/domain/entities/property_enquiry_request_entity.dart';
import 'package:nepal_homes/feature_property_enquiry/domain/usecases/usecases.dart';

part 'property_enquiry_state.dart';

class PropertyEnquiryCubit extends Cubit<PropertyEnquiryState> {
  final PostPropertyEnquiryUseCase postPropertyEnquiryUseCase;

  PropertyEnquiryCubit({@required this.postPropertyEnquiryUseCase})
      : super(PropertyEnquiryInitial());

  postEnquiry({@required PropertyEnquiryRequestEntity enquiryRequest}) async {
    if (state is PropertyEnquiryLoadingState) return;
    emit(PropertyEnquiryLoadingState());
    try {
      await postPropertyEnquiryUseCase.call(
          PostPropertyEnquiryUseCaseParams(enquiryRequest: enquiryRequest));
      emit(PropertyEnquirySuccessState(
          message: 'Enquiry posted. Listing agent will contact you soon.'));
    } catch (e) {
      log('Property enquiry post error: ', error: e);
      emit(PropertyEnquiryErrorState(
          message:
              'Unable to post enquiry. Make sure you are connected to the Internet.'));
    }
  }
}
