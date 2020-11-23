part of 'agency_detail_cubit.dart';

abstract class AgencyDetailState extends Equatable {
  const AgencyDetailState();

  @override
  List<Object> get props => [];
}

class AgencyDetailInitial extends AgencyDetailState {}

class AgencyDetailLoading extends AgencyDetailState {}

class AgencyDetailLoadSuccess extends AgencyDetailState {
  final AgencyDetailEntity agencyDetailEntity;

  AgencyDetailLoadSuccess({@required this.agencyDetailEntity});

  @override
  List<Object> get props => [this.agencyDetailEntity];
}

class AgencyDetailLoadEmpty extends AgencyDetailState {
  final String message;

  AgencyDetailLoadEmpty({@required this.message});

  @override
  List<Object> get props => [message];
}

class AgencyDetailLoadError extends AgencyDetailState {
  final String message;

  AgencyDetailLoadError({@required this.message});

  @override
  List<Object> get props => [message];
}

class AgencyDetaiError extends AgencyDetailState {
  final String message;

  AgencyDetaiError({@required this.message});

  @override
  List<Object> get props => [message];
}
