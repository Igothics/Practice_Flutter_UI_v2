import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TrashButton extends HookConsumerWidget {
  const TrashButton({super.key, this.onPressed,});
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;

    return IconButton.outlined(
      padding: const EdgeInsets.all(6.0),
      style: ButtonStyle(
        side: MaterialStateProperty.resolveWith<BorderSide?>((states) {
          if (states.contains(MaterialState.disabled)) {
            return BorderSide(color: Theme.of(context).disabledColor, width: 1.3);
          }
          return BorderSide(color: colorScheme.outline, width: 1.3);
        },
        ),
      ),
      onPressed: onPressed,
      icon: const Icon(Icons.delete_outline_rounded,),
    );
  }
}
