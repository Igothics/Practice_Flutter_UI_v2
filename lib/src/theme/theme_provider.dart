import 'dart:developer';

import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:practice_food_delivery/src/features/settings/presentation/user_settings_stream_provider.dart';

final themeModeProvider = AutoDisposeProvider<ThemeMode?>((ref) {
  final userSettings = ref.watch(userSettingsStreamProvider);
  log('[themeModeProvider]: currentUserSettings re-fetched');
  return userSettings.when(
    error: (error,_) => null,
    loading: () => null,
    data: (data) {
      if (data != null) {
        log('[themeModeProvider]: darkMode = ${data.darkMode}');
        return data.darkMode ? ThemeMode.dark : ThemeMode.light;
      }
      log('[themeModeProvider]: currentUserSettings is null');
      return null;
    },
  );
});

final seedColorProvider = AutoDisposeProvider<Color?>((ref) {
  final currentUserSettings = ref.watch(userSettingsStreamProvider);
  log('[seedColorProvider]: currentUserSettings re-fetched');
  return currentUserSettings.when(
    error: (error,_) => null,
    loading: () => null,
    data: (data) {
      if (data != null) {
        log('[seedColorProvider]: seedColor = ${data.seedColor}');
        return data.seedColor;
      }
      log('[seedColorProvider]: currentUserSettings is null');
      return null;
    },
  );
});

final baseThemeProvider = AutoDisposeProviderFamily<ThemeData, Brightness>(
  (ref, brightness) {
    final seedColor = ref.watch(seedColorProvider);
    log('[baseThemeProvider]: build or re-build - $brightness');

    return ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: seedColor ?? Colors.deepPurple,
        brightness: brightness,
      ).harmonized(),
      useMaterial3: true,
      appBarTheme: const AppBarTheme(
        scrolledUnderElevation: 0.0,
        backgroundColor: Colors.transparent,
      ),
      iconButtonTheme: IconButtonThemeData(
        style: IconButton.styleFrom(
          maximumSize: Size.infinite,
          minimumSize: Size.zero,
        ),
      ),
    );
  },
);