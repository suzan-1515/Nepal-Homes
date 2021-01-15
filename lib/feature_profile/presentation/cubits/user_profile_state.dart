part of 'user_profile_cubit.dart';

abstract class UserProfileState extends Equatable {
  const UserProfileState();

  @override
  List<Object> get props => [];
}

class UserProfileInitial extends UserProfileState {}

class UserProfileLoading extends UserProfileState {}

class UserProfileLoadSuccess extends UserProfileState {
  final UserProfileEntity user;

  UserProfileLoadSuccess(this.user);

  @override
  List<Object> get props => [user];
}

class UserProfileLoadError extends UserProfileState {
  final String message;

  UserProfileLoadError({this.message = "Unable to load data."});

  @override
  List<Object> get props => [message];
}

class UserProfileError extends UserProfileState {
  final String message;

  UserProfileError({this.message = "Something went wrong."});

  @override
  List<Object> get props => [message];
}
