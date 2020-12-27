part of 'recent_property_cubit.dart';

abstract class RecentPropertyState extends Equatable {
  const RecentPropertyState();

  @override
  List<Object> get props => [];
}

class RecentPropertyInitial extends RecentPropertyState {}

class RecentPropertyLoading extends RecentPropertyState {}

class RecentPropertyLoadSuccess extends RecentPropertyState {
  final List<PropertyEntity> properties;
  final bool hasMore;

  RecentPropertyLoadSuccess(this.properties, {this.hasMore = false});

  RecentPropertyLoadSuccess copyWith({
    List<PropertyEntity> properties,
    bool hasMore,
  }) =>
      RecentPropertyLoadSuccess(
        properties ?? this.properties,
        hasMore: hasMore ?? this.hasMore,
      );

  @override
  List<Object> get props => [properties, hasMore];
}

class RecentPropertyLoadEmpty extends RecentPropertyState {
  final String message;

  RecentPropertyLoadEmpty({this.message = 'Property data not available.'});

  @override
  List<Object> get props => [message];
}

class RecentPropertyLoadError extends RecentPropertyState {
  final String message;

  RecentPropertyLoadError({this.message = 'Unable to load data.'});

  @override
  List<Object> get props => [message];
}

class RecentPropertyError extends RecentPropertyState {
  final String message;

  RecentPropertyError({this.message});

  @override
  List<Object> get props => [message];
}
