part of 'property_cubit.dart';

abstract class PropertyState extends Equatable {
  const PropertyState();

  @override
  List<Object> get props => [];
}

class PropertyInitial extends PropertyState {}

class PropertyLoading extends PropertyState {}

class PropertyLoadingMore extends PropertyState {}

class PropertyLoadSuccess extends PropertyState {
  final List<PropertyUIModel> properties;
  final bool hasMore;

  PropertyLoadSuccess(this.properties, {this.hasMore = true});

  PropertyLoadSuccess copyWith({
    List<PropertyUIModel> properties,
    bool hasMore,
  }) =>
      PropertyLoadSuccess(
        properties ?? this.properties,
        hasMore: hasMore ?? this.hasMore,
      );

  @override
  List<Object> get props => [properties, hasMore];
}

class PropertyLoadEmpty extends PropertyState {
  final String message;

  PropertyLoadEmpty({this.message = 'Property data not available.'});

  @override
  List<Object> get props => [message];
}

class PropertyLoadError extends PropertyState {
  final String message;

  PropertyLoadError({this.message = 'Unable to load data.'});

  @override
  List<Object> get props => [message];
}

class PropertyError extends PropertyState {
  final String message;

  PropertyError({this.message});

  @override
  List<Object> get props => [message];
}

class PropertyFilterChanged extends PropertyState {
  final PropertyFilterEntity filter;

  PropertyFilterChanged({@required this.filter});

  @override
  List<Object> get props => [filter];
}
