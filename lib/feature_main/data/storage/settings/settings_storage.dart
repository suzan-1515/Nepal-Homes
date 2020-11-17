import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'storage.dart';

class SettingsStorage with Storage {
  final SharedPreferences _sharedPreferences;
  final String _useDarkModeKey = 'useDarkMode';
  final String _pitchBlackKey = 'pitchBlack';
  final String _themeSetBySystemKey = 'themeSetBySystem';

  SettingsStorage({@required SharedPreferences sharedPreferences})
      : _sharedPreferences = sharedPreferences;

  @override
  Future darkMode(bool value) {
    assert(value != null);
    return _sharedPreferences.setBool(_useDarkModeKey, value);
  }

  @override
  Future pitchBlackMode(bool value) {
    assert(value != null);
    return _sharedPreferences.setBool(_pitchBlackKey, value);
  }

  @override
  Future systemTheme(bool value) {
    assert(value != null);
    return _sharedPreferences.setBool(_themeSetBySystemKey, value);
  }

  @override
  bool loadDarkMode() {
    return _sharedPreferences.getBool(_useDarkModeKey);
  }

  @override
  bool loadPitchBlackMode() {
    return _sharedPreferences.getBool(_pitchBlackKey);
  }

  @override
  bool loadSystemTheme() {
    return _sharedPreferences.getBool(_themeSetBySystemKey);
  }
}
