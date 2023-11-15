import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:practice_food_delivery/src/features/navigation/presentation/drawer_state_provider.dart';

class ViewMoreButton extends HookConsumerWidget {
  const ViewMoreButton({super.key, required this.goToLocation,});
  final String goToLocation;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton.outlined(
            style: IconButton.styleFrom(shape: const CircleBorder()),
            onPressed: () {
              ref.read(drawerStateProvider.notifier).updateByLocation(goToLocation);
              context.go(goToLocation);
            },
            icon: const Icon(Icons.arrow_forward_rounded,),
          ),
          Text(
            'View more..',
            style: textTheme.bodyMedium?.copyWith(color: colorScheme.onSurfaceVariant,),
          ),
        ],
      ),
    );
  }
}
