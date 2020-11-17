import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class SettingsEntity extends Equatable {
  final bool useDarkMode;
  final bool usePitchBlack;
  final bool themeSetBySystem;
  SettingsEntity({
    @required this.useDarkMode,
    @required this.usePitchBlack,
    @required this.themeSetBySystem,
  });

  @override
  List<Object> get props {
    return [
      useDarkMode,
      usePitchBlack,
      themeSetBySystem,
    ];
  }

  SettingsEntity copyWith({
    bool useDarkMode,
    bool usePitchBlack,
    bool themeSetBySystem,
  }) {
    return SettingsEntity(
      useDarkMode: useDarkMode ?? this.useDarkMode,
      usePitchBlack: usePitchBlack ?? this.usePitchBlack,
      themeSetBySystem: themeSetBySystem ?? this.themeSetBySystem,
    );
  }

  @override
  bool get stringify => true;
}
