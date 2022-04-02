import 'dart:async';
import 'dart:developer';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:nepal_homes/core/constants/api_keys.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

class NotificationService {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  final SelectNotificationCallback selectNotificationCallback;
  final Future<dynamic> Function(int, String, String, String)
      onDidReceiveLocalNotification;

  final StreamController<String> _selectNotificationController =
      StreamController<String>();

  Stream<String> get selectNotificationStream =>
      _selectNotificationController.stream;

  NotificationService(this.flutterLocalNotificationsPlugin,
      {this.selectNotificationCallback, this.onDidReceiveLocalNotification}) {
    _initLocal();
    _initOneSignal();
  }

  _initLocal() {
    log('[NotificationService] _initLocal');
    const initializationSettingsAndroid =
        AndroidInitializationSettings('splash');
    final initializationSettingsIOS = IOSInitializationSettings(
        onDidReceiveLocalNotification: onDidReceiveLocalNotification);
    final initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );
    flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onSelectNotification: (String payload) async {
        if (payload != null) {
          log('[NotificationService] notification payload: $payload');
        }
        _selectNotificationController.add(payload);
      },
    );
  }

  _initOneSignal() async {
    log('[NotificationService] _initOneSignal');
    //Remove this method to stop OneSignal Debugging
    OneSignal.shared.setLogLevel(OSLogLevel.none, OSLogLevel.none);

    OneSignal.shared.setAppId(ApiKeys.ONESIGNAL_APP_ID);

// The promptForPushNotificationsWithUserResponse function will show the iOS push notification prompt. We recommend removing the following code and instead using an In-App Message to prompt for notification permission
    await OneSignal.shared
        .promptUserForPushNotificationPermission(fallbackToSettings: true);
  }

  Future<void> show(
    int id,
    String title,
    String message, {
    String channelId,
    String channelName,
    String channelDescription,
  }) async {
    final androidPlatformChannelSpecifics = AndroidNotificationDetails(
      channelId,
      channelName,
      channelDescription: channelDescription,
      priority: Priority.max,
      importance: Importance.max,
      visibility: NotificationVisibility.public,
    );
    const iOSPlatformChannelSpecifics = IOSNotificationDetails();
    final platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
      iOS: iOSPlatformChannelSpecifics,
    );

    await flutterLocalNotificationsPlugin.show(
      id,
      title,
      message,
      platformChannelSpecifics,
    );
  }

  Future<void> scheduleNotificationPeriodically(
      int id,
      String title,
      String message,
      String channelId,
      String channelName,
      String channelDescription,
      RepeatInterval interval) async {
    final androidPlatformChannelSpecifics = AndroidNotificationDetails(
      channelId,
      channelName,
      channelDescription: channelDescription,
      priority: Priority.max,
      importance: Importance.max,
      visibility: NotificationVisibility.public,
    );
    const iOSPlatformChannelSpecifics = IOSNotificationDetails();
    final platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
      iOS: iOSPlatformChannelSpecifics,
    );
    await flutterLocalNotificationsPlugin.periodicallyShow(
      id,
      title,
      message,
      interval,
      platformChannelSpecifics,
    );
  }

  Future<void> scheduleNotificationDaily(
      int id,
      String title,
      String message,
      String channelId,
      String channelName,
      String channelDescription,
      DateTime time) async {
    final androidPlatformChannelSpecifics = AndroidNotificationDetails(
      channelId,
      channelName,
      channelDescription: channelDescription,
      priority: Priority.max,
      importance: Importance.max,
      visibility: NotificationVisibility.public,
    );
    const iOSPlatformChannelSpecifics = IOSNotificationDetails();
    final platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
      iOS: iOSPlatformChannelSpecifics,
    );
    await flutterLocalNotificationsPlugin.zonedSchedule(
      id,
      title,
      message,
      time,
      platformChannelSpecifics,
      androidAllowWhileIdle: false,
      uiLocalNotificationDateInterpretation: null,
      matchDateTimeComponents: DateTimeComponents.time,
    );
  }

  Future<void> subscribe(String key, dynamic value) async {
    return OneSignal.shared.sendTag(key, value);
  }

  Future<void> unSubscribe(String key) async {
    return OneSignal.shared.deleteTag(key);
  }

  Future<void> subscribeAll(Map<String, String> tags) async {
    return OneSignal.shared.sendTags(tags);
  }

  Future<void> unSubscribeAll(List<String> tags) async {
    return OneSignal.shared.deleteTags(tags);
  }

  Future<void> setEmail(String email) {
    return OneSignal.shared.setEmail(email: email).catchError((onError) {
      log('[NotificationService] setEmail', error: onError);
    });
  }

  setDefaultLocalNotification() {
    log('[NotificationService] setDefaultLocalNotification');
    // this.scheduleNotificationDaily(
    //   NotificationChannels.kMorningNewsId,
    //   'Good Morning 🌅',
    //   'Your personalised daily news is ready. Click to read. 📰',
    //   NotificationChannels.kMorningNewsChannelId,
    //   NotificationChannels.kMorningNewsChannelName,
    //   NotificationChannels.kMorningNewsChannelDesc,
    //   tz.TZDateTime.from(
    //       DateTime(2020, 1, 1, 7), tz.getLocation('Asia/Kathmandu')),
    // );

    // this.scheduleNotificationDaily(
    //     NotificationChannels.kMorningHoroscopeId,
    //     'Good Morning 🌅',
    //     'Your daily horoscope is here. Click to read. 📰',
    //     NotificationChannels.kMorningHoroscopeChannelId,
    //     NotificationChannels.kMorningHoroscopeChannelName,
    //     NotificationChannels.kMorningHoroscopeChannelDesc,
    //     Time(7, 0, 0));
  }

  setDefaultRemoteNotification() {
    log('[NotificationService] setDefaultRemoteNotification');
  }

  dispose() {
    _selectNotificationController.close();
  }
}
