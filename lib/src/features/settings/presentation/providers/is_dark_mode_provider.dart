import 'package:practice_food_delivery/src/features/settings/presentation/providers/user_settings_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'is_dark_mode_provider.g.dart';

@riverpod
bool isDarkMode(IsDarkModeRef ref) {
  final result = ref.watch(
    userSettingsProvider.select(
      (value) => switch (value) {
        AsyncData(value: final value) => value.darkMode,
        _ => false,
      },
    ),
  );
  return result;
}
