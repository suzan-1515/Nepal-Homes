import 'package:nepal_homes/feature_main/domain/entities/settings_entity.dart';

mixin Repository {
  Future setDarkMode(bool value);
  Future setPitchBlackMode(bool value);
  Future setSystemTheme(bool value);

  Future<SettingsEntity> getSettings();
}
