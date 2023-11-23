import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:practice_food_delivery/src/features/settings/data/user_settings_repository_provider.dart';
import 'package:practice_food_delivery/src/features/settings/presentation/providers/is_dark_mode_provider.dart';

class DarkModeSwitchTile extends HookConsumerWidget {
  const DarkModeSwitchTile({
    super.key,
    this.dense = true,
    this.title = 'Dark mode',
  });
  final String title;
  final bool? dense;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;
    final isDarkMode = ref.watch(isDarkModeProvider);
    final userSettingsRepository = ref.watch(userSettingsRepositoryProvider);

    return SwitchListTile(
      dense: dense,
      value: isDarkMode,
      title: Text(title, style: textTheme.bodyLarge,),
      onChanged: (value) async {
        await userSettingsRepository.updateDarkMode(value);
      },
    );
  }
}
