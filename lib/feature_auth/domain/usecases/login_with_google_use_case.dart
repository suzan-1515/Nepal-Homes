import 'dart:developer';

import 'package:nepal_homes/core/usecases/usecase.dart';
import 'package:nepal_homes/feature_auth/domain/entities/authenticated_user_entity.dart';
import 'package:nepal_homes/feature_auth/domain/repositories/repository.dart';

class LoginWithGoogleUseCase
    implements UseCase<AuthenticatedUserEntity, NoParams> {
  final Repository _repository;

  LoginWithGoogleUseCase(this._repository);

  @override
  Future<AuthenticatedUserEntity> call(NoParams params) {
    try {
      return this._repository.loginWithGoogle();
    } catch (e) {
      log('LoginWithGoogleUseCase unsuccessful.', error: e);
      throw e;
    }
  }
}
