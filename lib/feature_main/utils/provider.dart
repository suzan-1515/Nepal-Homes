import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:nepal_homes/core/services/services.dart';
import 'package:nepal_homes/feature_main/data/datasources/local/settings/local_data_source.dart';
import 'package:nepal_homes/feature_main/data/datasources/local/settings/settings_local_data_source.dart';
import 'package:nepal_homes/feature_main/data/repositories/settings_repository.dart';
import 'package:nepal_homes/feature_main/data/storage/settings/settings_storage.dart';
import 'package:nepal_homes/feature_main/data/storage/settings/storage.dart';
import 'package:nepal_homes/feature_main/domain/repositories/settings/repository.dart';
import 'package:nepal_homes/feature_main/domain/usecases/settings/usecases.dart';
import 'package:nepal_homes/feature_main/presentation/blocs/settings/settings_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsProvider {
  SettingsProvider._();
  static setup() {
    GetIt.I.registerLazySingleton<Storage>(() =>
        SettingsStorage(sharedPreferences: GetIt.I.get<SharedPreferences>()));
    GetIt.I.registerLazySingleton<LocalDataSource>(
        () => SettingsLocalDataSource(GetIt.I.get<Storage>()));
    GetIt.I.registerLazySingleton<Repository>(() => SettingsRepository(
          GetIt.I.get<LocalDataSource>(),
          GetIt.I.get<AnalyticsService>(),
        ));
    GetIt.I.registerLazySingleton<GetSettingsUseCase>(
        () => GetSettingsUseCase(GetIt.I.get<Repository>()));
    GetIt.I.registerLazySingleton<SetDarkModeUseCase>(
        () => SetDarkModeUseCase(GetIt.I.get<Repository>()));
    GetIt.I.registerLazySingleton<SetPitchBlackModeUseCase>(
        () => SetPitchBlackModeUseCase(GetIt.I.get<Repository>()));
    GetIt.I.registerLazySingleton<SetSystemThemeUseCase>(
        () => SetSystemThemeUseCase(GetIt.I.get<Repository>()));

    GetIt.I.registerFactory<SettingsCubit>(() => SettingsCubit(
          getSettingsUseCase: GetIt.I.get<GetSettingsUseCase>(),
          setDarkModeUseCase: GetIt.I.get<SetDarkModeUseCase>(),
          setPitchBlackModeUseCase: GetIt.I.get<SetPitchBlackModeUseCase>(),
          setSystemThemeUseCase: GetIt.I.get<SetSystemThemeUseCase>(),
        )..getSettings());
  }

  static BlocProvider<SettingsCubit> settingsBlocProvider(
          {@required Widget child}) =>
      BlocProvider<SettingsCubit>(
        create: (context) => GetIt.I.get<SettingsCubit>(),
        child: child,
      );
}
