import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:nepal_homes/core/services/services.dart';
import 'package:nepal_homes/feature_main/presentation/ui/splash/splash_screen.dart';
import 'package:nepal_homes/feature_main/utils/provider.dart';
import 'package:nepali_utils/nepali_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

import 'core/themes.dart' as Themes;
import 'feature_auth/utils/providers.dart';
import 'feature_main/presentation/blocs/settings/settings_cubit.dart';
import 'global_providers.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  NepaliUtils(Language.nepali);
  GlobalProvider.setup(await SharedPreferences.getInstance());
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
  runApp(App());
}

class App extends StatelessWidget {
  ThemeData _getTheme(bool darkMode, bool pitchBlackMode) {
    return darkMode
        ? pitchBlackMode
            ? Themes.pitchBlack
            : Themes.darkTheme
        : Themes.lightTheme;
  }

  ThemeMode _getThemeMode(bool themeSetBySystem, bool darkMode) {
    return themeSetBySystem
        ? ThemeMode.system
        : (darkMode ? ThemeMode.dark : ThemeMode.light);
  }

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (_, orientation, deviceType) {
        return SettingsProvider.settingsBlocProvider(
          child: AuthProviders.authBlocProvider(
            child: BlocBuilder<SettingsCubit, SettingsState>(
              buildWhen: (previous, current) =>
                  (current is SettingsInitialState) ||
                  (current is SettingsDarkModeChangedState) ||
                  (current is SettingsPitchBlackModeChangedState) ||
                  (current is SettingsLoadSuccess) ||
                  (current is SettingsSystemThemeChangedState),
              builder: (context, state) {
                if (state is SettingsLoadSuccess ||
                    state is SettingsDarkModeChangedState ||
                    state is SettingsPitchBlackModeChangedState ||
                    state is SettingsSystemThemeChangedState) {
                  var settings = context.watch<SettingsCubit>().settings;
                  return MaterialApp(
                    theme:
                        _getTheme(settings.useDarkMode, settings.usePitchBlack),
                    onGenerateRoute:
                        GetIt.I.get<NavigationService>().generateRoute,
                    initialRoute: SplashScreen.ROUTE_NAME,
                    themeMode: settings.themeSetBySystem
                        ? ThemeMode.system
                        : _getThemeMode(
                            settings.themeSetBySystem, settings.useDarkMode),
                    darkTheme: settings.usePitchBlack
                        ? Themes.pitchBlack
                        : Themes.darkTheme,
                    navigatorObservers: [
                      GetIt.I.get<AnalyticsService>().getAnalyticsObserver(),
                    ],
                  );
                }

                return Container(
                  width: double.infinity,
                  height: double.infinity,
                  color: Colors.white,
                );
              },
            ),
          ),
        );
      },
    );
  }
}
