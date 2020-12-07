part of 'property_filter_cubit.dart';

abstract class PropertyFilterState extends Equatable {
  const PropertyFilterState();

  @override
  List<Object> get props => [];
}

class PropertyFilterInitial extends PropertyFilterState {}

class PropertyFilterLoading extends PropertyFilterState {}

class PropertyFilterLoadSuccess extends PropertyFilterState {
  final PropertyFilterEntity propertyFilter;

  PropertyFilterLoadSuccess({@required this.propertyFilter});

  @override
  List<Object> get props => [propertyFilter];
}

class PropertyFilterLoadEmpty extends PropertyFilterState {
  final String message;

  PropertyFilterLoadEmpty({@required this.message});

  @override
  List<Object> get props => [message];
}

class PropertyFilterLoadError extends PropertyFilterState {
  final String message;

  PropertyFilterLoadError({@required this.message});

  @override
  List<Object> get props => [message];
}

class PropertyFilterError extends PropertyFilterState {
  final String message;

  PropertyFilterError({@required this.message});

  @override
  List<Object> get props => [message];
}

class PropertyFilterChanged extends PropertyFilterState {
  final PropertyFilterEntity filter;

  PropertyFilterChanged({@required this.filter});

  @override
  List<Object> get props => [filter];
}
