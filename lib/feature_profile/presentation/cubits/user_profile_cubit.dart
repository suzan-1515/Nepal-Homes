import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:nepal_homes/core/usecases/usecase.dart';
import 'package:nepal_homes/feature_profile/domain/entities/user_profile_entity.dart';
import 'package:nepal_homes/feature_profile/domain/usecases/usecases.dart';

part 'user_profile_state.dart';

class UserProfileCubit extends Cubit<UserProfileState> {
  final GetProfileUseCase getProfileUseCase;

  UserProfileCubit({
    @required this.getProfileUseCase,
  }) : super(UserProfileInitial());

  getProfile() async {
    if (state is UserProfileLoading) return;
    emit(UserProfileLoading());
    try {
      final UserProfileEntity userProfileEntity =
          await getProfileUseCase.call(NoParams());
      if (userProfileEntity == null)
        emit(UserProfileLoadError(message: 'Unable to load profile data.'));
      emit(UserProfileLoadSuccess(userProfileEntity));
    } catch (e) {
      log('User profile load error: ', error: e);
      emit(UserProfileLoadError(
          message:
              'Unable to load data. Make sure you are connected to the Internet.'));
    }
  }
}
