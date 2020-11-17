import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:nepal_homes/core/usecases/usecase.dart';
import 'package:nepal_homes/feature_main/domain/entities/settings_entity.dart';
import 'package:nepal_homes/feature_main/domain/usecases/settings/get_settings_use_case.dart';
import 'package:nepal_homes/feature_main/domain/usecases/settings/usecases.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  final SetDarkModeUseCase setDarkModeUseCase;
  final SetPitchBlackModeUseCase setPitchBlackModeUseCase;
  final SetSystemThemeUseCase setSystemThemeUseCase;
  final GetSettingsUseCase getSettingsUseCase;
  SettingsCubit({
    @required this.setPitchBlackModeUseCase,
    @required this.setSystemThemeUseCase,
    @required this.setDarkModeUseCase,
    @required this.getSettingsUseCase,
  }) : super(SettingsInitialState());

  SettingsEntity _settingsEntity;
  SettingsEntity get settings => _settingsEntity;

  getSettings() async {
    try {
      final settingEntity = await getSettingsUseCase.call(NoParams());
      this._settingsEntity = settingEntity;
      emit(SettingsLoadSuccess(settingEntity));
    } catch (e) {
      log('Settings load error: ', error: e);
      emit(SettingsErrorState(message: 'Unable to load settings.'));
    }
  }

  setDarkMode(bool value) async {
    try {
      await setDarkModeUseCase.call(SetDarkModeUseCaseParams(value: value));
      this._settingsEntity = this._settingsEntity.copyWith(useDarkMode: value);
      emit(SettingsDarkModeChangedState(value: value));
    } catch (e) {
      log('Dark mode set error: ', error: e);
      emit(SettingsErrorState(message: 'Unable to change dark mode.'));
    }
  }

  setPitchBlackMode(bool value) async {
    try {
      await setPitchBlackModeUseCase
          .call(SetPitchBlackModeUseCaseParams(value: value));
      this._settingsEntity =
          this._settingsEntity.copyWith(usePitchBlack: value);
      emit(SettingsPitchBlackModeChangedState(value: value));
    } catch (e) {
      log('Pitch black mode set error: ', error: e);
      emit(SettingsErrorState(message: 'Unable to change pitch black mode.'));
    }
  }

  setUseSystemThemeMode(bool value) async {
    try {
      await setSystemThemeUseCase
          .call(SetSystemThemeUseCaseParams(value: value));
      this._settingsEntity =
          this._settingsEntity.copyWith(themeSetBySystem: value);
      emit(SettingsSystemThemeChangedState(value: value));
    } catch (e) {
      log('Use system theme mode set error: ', error: e);
      emit(SettingsErrorState(message: 'Unable to change system theme mode.'));
    }
  }
}
