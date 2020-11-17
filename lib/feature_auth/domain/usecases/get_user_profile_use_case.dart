import 'dart:developer';

import 'package:nepal_homes/core/usecases/usecase.dart';
import 'package:nepal_homes/feature_auth/domain/entities/user_entity.dart';
import 'package:nepal_homes/feature_auth/domain/repositories/repository.dart';

class GetUserProfileUseCase implements UseCase<UserEntity, NoParams> {
  final Repository _repository;

  GetUserProfileUseCase(this._repository);

  @override
  Future<UserEntity> call(NoParams params) {
    try {
      return this._repository.getUserProfile();
    } catch (e) {
      log('GetUserProfileUseCase unsuccessful.', error: e);
      throw e;
    }
  }
}
