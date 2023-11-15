import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:practice_food_delivery/src/theme/theme_provider.dart';

final darkModeSwitchProvider = StateProvider.autoDispose<bool>((ref) {
    final themeMode = ref.watch(themeModeProvider);
    return themeMode == ThemeMode.dark;
  },
);