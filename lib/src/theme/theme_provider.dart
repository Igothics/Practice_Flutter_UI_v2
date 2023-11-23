import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:practice_food_delivery/src/features/settings/presentation/providers/user_settings_provider.dart';

final themeModeProvider = AutoDisposeProvider<ThemeMode?>(
  (ref) {
    final result = ref.watch(
      userSettingsProvider.select(
        (value) => switch (value) {
          AsyncData(value: final value) => value.darkMode ? ThemeMode.dark : ThemeMode.light,
          _ => null,
        },
      ),
    );
    return result;
  },
  name: 'themeMode',
);

final seedColorProvider = AutoDisposeProvider<Color?>(
  (ref) {
    final result = ref.watch(
      userSettingsProvider.select(
        (value) => switch (value) {
          AsyncData(value: final value) => value.seedColor,
          _ => null,
        },
      ),
    );
    return result;
  },
  name: 'seedColor',
);

final baseThemeProvider = AutoDisposeProviderFamily<ThemeData, Brightness>(
  (ref, brightness) {
    final seedColor = ref.watch(seedColorProvider);

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
  name: 'baseTheme',
);
