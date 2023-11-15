import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:practice_food_delivery/src/features/authentication/application/auth_provider.dart';
import 'package:practice_food_delivery/src/features/settings/presentation/user_settings_stream_provider.dart';

class NavigationDrawerButton extends HookConsumerWidget {
  const NavigationDrawerButton({super.key, this.icon, this.label, this.onPressed,});
  final Widget? icon;
  final Widget? label;
  final VoidCallback? onPressed;

  factory NavigationDrawerButton.darkMode(WidgetRef ref){
    final userSettingsController = ref.watch(userSettingsStreamProvider.notifier);
    final isDark = userSettingsController.isDarkMode();

    return NavigationDrawerButton(
      icon: Icon(isDark ? Icons.dark_mode : Icons.dark_mode_outlined),
      label: Text(isDark ? 'Light Mode' : 'Dark Mode'),
      onPressed: () => userSettingsController.updateDarkMode(!isDark),
    );
  }

  factory NavigationDrawerButton.logout(BuildContext context, WidgetRef ref,){
    return NavigationDrawerButton(
      icon: const Icon(Icons.logout_rounded,),
      label: const Text('Log out',),
      onPressed: () async {
        showDialog(
          barrierDismissible: false,
          context: context,
          builder: (_) => const Center(child: CircularProgressIndicator()),
        );
        await ref.read(authProvider.notifier).signOut();
      },
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 1.0,
          padding: const EdgeInsets.all(16.0),
          foregroundColor: colorScheme.onSecondaryContainer,
          backgroundColor: colorScheme.surface,
          shadowColor: Colors.transparent,
        ),
        onPressed: onPressed,
        child: Row(
          children: [
            icon ?? const SizedBox(),
            const SizedBox(width: 12.0,),
            label ?? const SizedBox(),
          ],
        ),
      ),
    );
  }
}
