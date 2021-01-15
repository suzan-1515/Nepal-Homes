import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:event_bus/event_bus.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get_it/get_it.dart';
import 'package:nepal_homes/core/services/services.dart';
import 'package:nepal_homes/feature_agencies/utils/provider.dart';
import 'package:nepal_homes/feature_main/utils/provider.dart';
import 'package:nepal_homes/feature_profile/utils/providers.dart';
import 'package:nepal_homes/feature_property_enquiry/utils/providers.dart';
import 'package:nepal_homes/feature_property_listing/utils/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/handlers/notification_handler.dart';
import 'core/network/http_manager/app_http_manager.dart';
import 'core/network/http_manager/http_manager.dart';
import 'core/network/network_info.dart';
import 'feature_auth/utils/providers.dart';
import 'feature_news/utils/provider.dart';

class GlobalProvider {
  GlobalProvider._();

  static setup(SharedPreferences sharedPreferences) {
    GetIt.I.registerSingleton<EventBus>(EventBus());
    GetIt.I.registerLazySingleton<SharedPreferences>(
      () => sharedPreferences,
    );
    GetIt.I.registerLazySingleton<PreferenceService>(
      () => PreferenceService(GetIt.I.get<SharedPreferences>()),
    );
    GetIt.I.registerLazySingleton<HttpManager>(
      () => AppHttpManager(),
    );
    GetIt.I.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(DataConnectionChecker()),
    );
    GetIt.I.registerLazySingleton<CrashAnalyticsService>(
      () => CrashAnalyticsService(),
    );
    GetIt.I.registerLazySingleton<AnalyticsService>(
      () => AnalyticsService(),
    );
    GetIt.I.registerLazySingleton<DynamicLinkService>(
      () => DynamicLinkService(),
      dispose: (param) => param.dispose(),
    );
    GetIt.I.registerLazySingleton<NavigationService>(
      () => NavigationService(),
    );
    GetIt.I.registerLazySingleton<InAppMessagingService>(
      () => InAppMessagingService(),
    );
    GetIt.I.registerLazySingleton<ShareService>(
      () => ShareService(GetIt.I.get<AnalyticsService>()),
    );
    GetIt.I.registerLazySingleton<NotificationService>(
      () => NotificationService(FlutterLocalNotificationsPlugin()),
      dispose: (param) => param.dispose(),
    );
    GetIt.I.registerSingleton<NotificationHandler>(
      NotificationHandler(
        GetIt.I.get<NotificationService>(),
        GetIt.I.get<PreferenceService>(),
      ),
      dispose: (param) => param.dispose(),
    );

    AuthProviders.setup();
    UserProfileProviders.setup();
    SettingsProvider.setup();
    PropertyProvider.setup();
    AgencyProvider.setup();
    NewsProvider.setup();
    PropertyEnquiryProviders.setup();
  }
}
