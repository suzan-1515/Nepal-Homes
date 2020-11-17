import 'dart:developer';

import 'package:nepal_homes/core/usecases/usecase.dart';
import 'package:nepal_homes/feature_main/domain/entities/settings_entity.dart';
import 'package:nepal_homes/feature_main/domain/repositories/settings/repository.dart';

class GetSettingsUseCase implements UseCase<SettingsEntity, NoParams> {
  final Repository _repository;

  GetSettingsUseCase(this._repository);

  @override
  Future<SettingsEntity> call(NoParams params) {
    try {
      return this._repository.getSettings();
    } catch (e) {
      log('GetSettingsUseCase unsuccessful.', error: e);
      throw e;
    }
  }
}
