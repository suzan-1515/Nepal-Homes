part of 'property_detail_cubit.dart';

abstract class PropertyDetailState extends Equatable {
  const PropertyDetailState();

  @override
  List<Object> get props => [];
}

class PropertyDetailInitial extends PropertyDetailState {}

class PropertyDetailLoading extends PropertyDetailState {}

class PropertyDetailLoadSuccess extends PropertyDetailState {
  final PropertyDetailWrapperEntity propertyDetailEntity;

  PropertyDetailLoadSuccess({@required this.propertyDetailEntity});

  @override
  List<Object> get props => [this.propertyDetailEntity];
}

class PropertyDetailLoadEmpty extends PropertyDetailState {
  final String message;

  PropertyDetailLoadEmpty({@required this.message});

  @override
  List<Object> get props => [message];
}

class PropertyDetailLoadError extends PropertyDetailState {
  final String message;

  PropertyDetailLoadError({@required this.message});

  @override
  List<Object> get props => [message];
}

class PropertyDetaiError extends PropertyDetailState {
  final String message;

  PropertyDetaiError({@required this.message});

  @override
  List<Object> get props => [message];
}
