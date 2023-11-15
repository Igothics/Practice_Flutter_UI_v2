import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:practice_food_delivery/src/common_widgets/round_text_avatar.dart';
import 'package:practice_food_delivery/src/common_widgets/navigation_drawer_button.dart';
import 'package:practice_food_delivery/src/features/authentication/application/auth_provider.dart';
import 'package:practice_food_delivery/src/features/authentication/domain/user.dart';
import 'package:practice_food_delivery/src/features/navigation/presentation/drawer_state_provider.dart';

class NavigationDrawerBuilder extends HookConsumerWidget {
  const NavigationDrawerBuilder({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authProvider).currentUser;
    final drawerState = ref.watch(drawerStateProvider);
    final drawerController = ref.watch(drawerStateProvider.notifier);
    final destinations = drawerController.getDrawerDestinations();

    return NavigationDrawer(
      selectedIndex: drawerState.id,
      children: [
        _buildHeader(context, user),
        const SizedBox(height: 8.0,),
        ...destinations,
        const Divider(),
        NavigationDrawerButton.darkMode(ref),
        NavigationDrawerButton.logout(context, ref),
      ],
      onDestinationSelected: (index) {
        final location = drawerController.updateAndReturnLocation(index);
        drawerController.triggerCallback();
        context.go(location); // should never watch in function
      },
    );
  }

  Widget _buildHeader(BuildContext context, User? user) {
    final textTheme = Theme.of(context).textTheme;
    const textPlaceHolder = 'Unknown';

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          RoundTextAvatar(
            label: user?.displayName ?? textPlaceHolder,
            radius: 32.0,
            labelTextStyle: textTheme.headlineLarge,
            background: user?.backgroundColor,
          ),
          const SizedBox(width: 16.0,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  user?.displayName ?? textPlaceHolder,
                  overflow: TextOverflow.ellipsis,
                  style: textTheme.bodyLarge,
                ),
                Text(
                  user?.email ?? textPlaceHolder,
                  overflow: TextOverflow.ellipsis,
                  style: textTheme.bodyMedium,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
