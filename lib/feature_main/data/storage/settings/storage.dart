mixin Storage {
  Future darkMode(bool value);
  Future pitchBlackMode(bool value);
  Future systemTheme(bool value);

  bool loadDarkMode();
  bool loadPitchBlackMode();
  bool loadSystemTheme();
}
