import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:practice_food_delivery/src/features/navigation/presentation/providers/drawer_state_provider.dart';
import 'package:practice_food_delivery/src/features/navigation/presentation/widgets/drawer_dark_mode_button.dart';
import 'package:practice_food_delivery/src/features/navigation/presentation/widgets/drawer_header_builder.dart';
import 'package:practice_food_delivery/src/features/navigation/presentation/widgets/drawer_log_out_button.dart';
class NavigationDrawerBuilder extends HookConsumerWidget {
  const NavigationDrawerBuilder({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final drawerState = ref.watch(drawerStateProvider);
    final drawerController = ref.watch(drawerStateProvider.notifier);
    final navigationDrawerItems = drawerController.getDrawerItems();

    return NavigationDrawer(
      selectedIndex: drawerState.id,
      children: [
        const DrawerHeaderBuilder(),
        const SizedBox(height: 8.0,),
        ...navigationDrawerItems,
        const Divider(),
        const DrawerDarkModeButton(),
        const DrawerLogoutButton(),
      ],
      onDestinationSelected: (index) {
        final location = drawerController.updateAndReturnLocation(index);
        drawerController.triggerCallback();
        context.go(location); // should never watch in function
      },
    );
  }
}
