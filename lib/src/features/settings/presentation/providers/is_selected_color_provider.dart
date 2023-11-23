import 'package:practice_food_delivery/src/features/settings/presentation/providers/user_settings_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'is_selected_color_provider.g.dart';

@riverpod
bool isSelectedColor(IsSelectedColorRef ref, int? colorValue) {
  final result = ref.watch(
    userSettingsProvider.select(
      (value) => switch(value) {
        AsyncData(value: final value) => value.seedColor.value == colorValue,
        _ => false,
      },
    ),
  );
  return result;
}
