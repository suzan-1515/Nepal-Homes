part of 'featured_property_cubit.dart';

abstract class FeaturedPropertyState extends Equatable {
  const FeaturedPropertyState();

  @override
  List<Object> get props => [];
}

class FeaturedPropertyInitial extends FeaturedPropertyState {}

class FeaturedPropertyLoading extends FeaturedPropertyState {}

class FeaturedPropertyLoadSuccess extends FeaturedPropertyState {
  final List<PropertyEntity> properties;
  final bool hasMore;

  FeaturedPropertyLoadSuccess(this.properties, {this.hasMore = false});

  FeaturedPropertyLoadSuccess copyWith({
    List<PropertyEntity> properties,
    bool hasMore,
  }) =>
      FeaturedPropertyLoadSuccess(
        properties ?? this.properties,
        hasMore: hasMore ?? this.hasMore,
      );

  @override
  List<Object> get props => [properties, hasMore];
}

class FeaturedPropertyLoadEmpty extends FeaturedPropertyState {
  final String message;

  FeaturedPropertyLoadEmpty({this.message = 'Property data not available.'});

  @override
  List<Object> get props => [message];
}

class FeaturedPropertyLoadError extends FeaturedPropertyState {
  final String message;

  FeaturedPropertyLoadError({this.message = 'Unable to load data.'});

  @override
  List<Object> get props => [message];
}

class FeaturedPropertyError extends FeaturedPropertyState {
  final String message;

  FeaturedPropertyError({this.message});

  @override
  List<Object> get props => [message];
}
