import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class NavigationDrawerButton extends HookConsumerWidget {
  const NavigationDrawerButton({super.key, this.icon, this.label, this.onPressed,});
  final Widget? icon;
  final Widget? label;
  final VoidCallback? onPressed;

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
