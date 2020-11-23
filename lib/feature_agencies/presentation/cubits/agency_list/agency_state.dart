part of 'agency_cubit.dart';

abstract class AgencyState extends Equatable {
  const AgencyState();

  @override
  List<Object> get props => [];
}

class AgencyInitial extends AgencyState {}

class AgencyLoading extends AgencyState {}

class AgencyLoadingMore extends AgencyState {}

class AgencyLoadSuccess extends AgencyState {
  final List<AgencyUIModel> agencies;
  final bool hasMore;

  AgencyLoadSuccess(this.agencies, {this.hasMore = true});

  AgencyLoadSuccess copyWith({
    List<AgencyUIModel> agencies,
    bool hasMore,
  }) =>
      AgencyLoadSuccess(
        agencies ?? this.agencies,
        hasMore: hasMore ?? this.hasMore,
      );

  @override
  List<Object> get props => [agencies, hasMore];
}

class AgencyLoadEmpty extends AgencyState {
  final String message;

  AgencyLoadEmpty({this.message = 'Agency data not available.'});

  @override
  List<Object> get props => [message];
}

class AgencyLoadError extends AgencyState {
  final String message;

  AgencyLoadError({this.message = 'Unable to load data.'});

  @override
  List<Object> get props => [message];
}

class AgencyError extends AgencyState {
  final String message;

  AgencyError({this.message});

  @override
  List<Object> get props => [message];
}
