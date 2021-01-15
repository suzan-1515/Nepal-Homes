import 'dart:developer';

import 'package:nepal_homes/core/usecases/usecase.dart';
import 'package:nepal_homes/feature_profile/domain/entities/user_profile_entity.dart';
import 'package:nepal_homes/feature_profile/domain/repositories/repository.dart';

class GetProfileUseCase implements UseCase<UserProfileEntity, NoParams> {
  final Repository _repository;

  GetProfileUseCase(this._repository);

  @override
  Future<UserProfileEntity> call(NoParams params) {
    try {
      return this._repository.getUserProfile();
    } catch (e) {
      log('GetProfileUseCase unsuccessful.', error: e);
      throw e;
    }
  }
}
