import 'dart:developer';

import 'package:nepal_homes/core/usecases/usecase.dart';
import 'package:nepal_homes/feature_auth/domain/entities/authenticated_user_entity.dart';
import 'package:nepal_homes/feature_auth/domain/repositories/repository.dart';

class AutoLoginUseCase implements UseCase<AuthenticatedUserEntity, NoParams> {
  final Repository _repository;

  AutoLoginUseCase(this._repository);

  @override
  Future<AuthenticatedUserEntity> call(NoParams params) {
    try {
      return this._repository.autoLogin();
    } catch (e) {
      log('AutoLoginUseCase unsuccessful.', error: e);
      throw e;
    }
  }
}
