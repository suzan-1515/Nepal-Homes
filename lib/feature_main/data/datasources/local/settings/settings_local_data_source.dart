import 'package:nepal_homes/feature_main/data/storage/settings/storage.dart';

import 'local_data_source.dart';

class SettingsLocalDataSource with LocalDataSource {
  final Storage storage;

  SettingsLocalDataSource(this.storage);

  @override
  Future darkMode(bool value) {
    return storage.darkMode(value);
  }

  @override
  bool loadDarkMode() {
    return storage.loadDarkMode();
  }

  @override
  bool loadPitchBlackMode() {
    return storage.loadPitchBlackMode();
  }

  @override
  bool loadSystemTheme() {
    return storage.loadSystemTheme();
  }

  @override
  Future pitchBlackMode(bool value) {
    return storage.pitchBlackMode(value);
  }

  @override
  Future systemTheme(bool value) {
    return storage.systemTheme(value);
  }
}
