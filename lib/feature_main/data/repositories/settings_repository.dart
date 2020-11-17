import 'package:nepal_homes/core/services/services.dart';
import 'package:nepal_homes/feature_main/data/datasources/local/settings/local_data_source.dart';
import 'package:nepal_homes/feature_main/domain/entities/settings_entity.dart';
import 'package:nepal_homes/feature_main/domain/repositories/settings/repository.dart';

class SettingsRepository with Repository {
  final LocalDataSource _localDataSource;
  final AnalyticsService _analyticsService;

  SettingsRepository(this._localDataSource, this._analyticsService);

  @override
  Future<SettingsEntity> getSettings() async {
    SettingsEntity settings = SettingsEntity(
      themeSetBySystem: _localDataSource.loadSystemTheme() ?? false,
      useDarkMode: _localDataSource.loadDarkMode() ?? false,
      usePitchBlack: _localDataSource.loadPitchBlackMode() ?? false,
    );

    return settings;
  }

  @override
  Future setDarkMode(bool value) {
    return _localDataSource.darkMode(value).then(
          (_) => _analyticsService.logDarkMode(enable: value),
        );
  }

  @override
  Future setPitchBlackMode(bool value) {
    return _localDataSource
        .pitchBlackMode(value)
        .then((_) => _analyticsService.logPitchBlackMode(value: value));
  }

  @override
  Future setSystemTheme(bool value) {
    return _localDataSource
        .systemTheme(value)
        .then((_) => _analyticsService.logUseSystemTheme(value: value));
  }
}
