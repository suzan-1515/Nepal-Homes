import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:flutter/foundation.dart';

class AnalyticsService {
  final FirebaseAnalytics _analytics = FirebaseAnalytics();

  FirebaseAnalyticsObserver getAnalyticsObserver() =>
      FirebaseAnalyticsObserver(analytics: _analytics);

//User
  Future setUser({@required String userId}) async {
    await _analytics.setUserId(userId);
  }

  Future logLogin({String method = 'google'}) async {
    return await _analytics.logLogin(loginMethod: method);
  }

  Future logSignUp({String method = 'google'}) async {
    return await _analytics.logSignUp(signUpMethod: method);
  }

  Future logLogout() async {
    return await _analytics.logEvent(name: "logout");
  }

  Future logShare({String postId, String method, String contentType}) {
    return _analytics.logShare(
      contentType: contentType,
      itemId: postId,
      method: method,
    );
  }

  // #Settings
  Future logDarkMode({@required bool enable}) {
    return _analytics
        .logEvent(name: 'dark_mode', parameters: {'enable': enable});
  }

  Future logUseSystemTheme({@required bool value}) {
    return _analytics
        .logEvent(name: 'system_theme', parameters: {'enable': value});
  }

  Future logPitchBlackMode({@required bool value}) {
    return _analytics
        .logEvent(name: 'pitch_black_mode', parameters: {'enable': value});
  }
}
