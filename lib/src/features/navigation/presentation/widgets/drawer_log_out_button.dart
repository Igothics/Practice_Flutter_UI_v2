import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:practice_food_delivery/src/common_widgets/navigation_drawer_button.dart';
import 'package:practice_food_delivery/src/features/authentication/application/auth_serviced_provider.dart';

class DrawerLogoutButton extends HookConsumerWidget {
  const DrawerLogoutButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return NavigationDrawerButton(
      icon: const Icon(Icons.logout_rounded,),
      label: const Text('Log out',),
      onPressed: () async {
        showDialog(
          barrierDismissible: false,
          context: context,
          builder: (_) => const Center(child: CircularProgressIndicator()),
        );
        await Future.delayed(const Duration(milliseconds: 300),);
        await ref.read(authServiceProvider.notifier).signOut();
      },
    );
  }
}
