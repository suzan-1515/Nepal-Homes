part of 'property_enquiry_cubit.dart';

abstract class PropertyEnquiryState extends Equatable {
  const PropertyEnquiryState();

  @override
  List<Object> get props => [];
}

class PropertyEnquiryInitial extends PropertyEnquiryState {}

class PropertyEnquiryLoadingState extends PropertyEnquiryState {}

class PropertyEnquirySuccessState extends PropertyEnquiryState {
  final String message;

  PropertyEnquirySuccessState({this.message = 'Enquiry posted!'});

  @override
  List<Object> get props => [message];
}

class PropertyEnquiryErrorState extends PropertyEnquiryState {
  final String message;

  PropertyEnquiryErrorState({this.message = 'Unable to post enquiry.'});

  @override
  List<Object> get props => [message];
}
