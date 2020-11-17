part of 'settings_cubit.dart';

abstract class SettingsState extends Equatable {
  const SettingsState();

  @override
  List<Object> get props => [];
}

class SettingsInitialState extends SettingsState {}

class SettingsLoadSuccess extends SettingsState {
  final SettingsEntity settingsEntity;

  SettingsLoadSuccess(this.settingsEntity);
  @override
  List<Object> get props => [settingsEntity];
}

class SettingsDarkModeChangedState extends SettingsState {
  final bool value;

  SettingsDarkModeChangedState({@required this.value});

  @override
  List<Object> get props => [value];
}

class SettingsPitchBlackModeChangedState extends SettingsState {
  final bool value;

  SettingsPitchBlackModeChangedState({@required this.value});

  @override
  List<Object> get props => [value];
}

class SettingsSystemThemeChangedState extends SettingsState {
  final bool value;

  SettingsSystemThemeChangedState({@required this.value});

  @override
  List<Object> get props => [value];
}

class SettingsErrorState extends SettingsState {
  final String message;

  SettingsErrorState({@required this.message});

  @override
  List<Object> get props => [message];
}
