import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:practice_food_delivery/src/common_widgets/navigation_drawer_button.dart';
import 'package:practice_food_delivery/src/features/settings/data/user_settings_repository_provider.dart';
import 'package:practice_food_delivery/src/features/settings/presentation/providers/user_settings_provider.dart';

class DrawerDarkModeButton extends HookConsumerWidget {
  const DrawerDarkModeButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userSettings = ref.watch(userSettingsProvider);
    final userSettingsRepository = ref.watch(userSettingsRepositoryProvider);

    return userSettings.when(
      error: (error, _) => const NavigationDrawerButton(
        icon: Icon(Icons.error_outline_rounded),
        label: Text('Error!',),
      ),
      loading: () => const NavigationDrawerButton(
        icon: Icon(Icons.running_with_errors),
        label: Text('Loading...',),
      ),
      data: (data) {
        final isDark = data.darkMode;
        return NavigationDrawerButton(
          icon: Icon(isDark ? Icons.dark_mode : Icons.dark_mode_outlined),
          label: Text(isDark ? 'Light Mode' : 'Dark Mode'),
          onPressed: () async {
            await userSettingsRepository.updateDarkMode(!isDark);
          },
        );
      },
    );
  }
}
