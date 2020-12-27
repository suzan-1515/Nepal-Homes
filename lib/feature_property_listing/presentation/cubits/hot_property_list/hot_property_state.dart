part of 'hot_property_cubit.dart';

abstract class HotPropertyState extends Equatable {
  const HotPropertyState();

  @override
  List<Object> get props => [];
}

class HotPropertyInitial extends HotPropertyState {}

class HotPropertyLoading extends HotPropertyState {}

class HotPropertyLoadSuccess extends HotPropertyState {
  final List<PropertyEntity> properties;
  final bool hasMore;

  HotPropertyLoadSuccess(this.properties, {this.hasMore = false});

  HotPropertyLoadSuccess copyWith({
    List<PropertyEntity> properties,
    bool hasMore,
  }) =>
      HotPropertyLoadSuccess(
        properties ?? this.properties,
        hasMore: hasMore ?? this.hasMore,
      );

  @override
  List<Object> get props => [properties, hasMore];
}

class HotPropertyLoadEmpty extends HotPropertyState {
  final String message;

  HotPropertyLoadEmpty({this.message = 'Property data not available.'});

  @override
  List<Object> get props => [message];
}

class HotPropertyLoadError extends HotPropertyState {
  final String message;

  HotPropertyLoadError({this.message = 'Unable to load data.'});

  @override
  List<Object> get props => [message];
}

class HotPropertyError extends HotPropertyState {
  final String message;

  HotPropertyError({this.message});

  @override
  List<Object> get props => [message];
}
