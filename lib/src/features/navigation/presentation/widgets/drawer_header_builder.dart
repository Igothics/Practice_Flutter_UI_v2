import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:practice_food_delivery/src/common_widgets/round_text_avatar.dart';
import 'package:practice_food_delivery/src/features/authentication/application/auth_serviced_provider.dart';

class DrawerHeaderBuilder extends HookConsumerWidget {
  const DrawerHeaderBuilder({super.key});
  static const _textPlaceHolder = 'Unknown';
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authServiceProvider).currentUser;
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          RoundTextAvatar(
            label: user?.displayName ?? _textPlaceHolder,
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
                  user?.displayName ?? _textPlaceHolder,
                  overflow: TextOverflow.ellipsis,
                  style: textTheme.bodyLarge,
                ),
                Text(
                  user?.email ?? _textPlaceHolder,
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
