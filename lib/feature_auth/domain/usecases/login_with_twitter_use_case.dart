import 'dart:developer';

import 'package:nepal_homes/core/usecases/usecase.dart';
import 'package:nepal_homes/feature_auth/domain/entities/user_entity.dart';
import 'package:nepal_homes/feature_auth/domain/repositories/repository.dart';

class LoginWithTwitterUseCase implements UseCase<UserEntity, NoParams> {
  final Repository _repository;

  LoginWithTwitterUseCase(this._repository);

  @override
  Future<UserEntity> call(NoParams params) {
    try {
      return this._repository.loginWithTwitter();
    } catch (e) {
      log('LoginWithTwitterUseCase unsuccessful.', error: e);
      throw e;
    }
  }
}
