import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:practice_food_delivery/src/common_widgets/trash_icon.dart';

class TrashButton extends HookConsumerWidget {
  const TrashButton({super.key, this.onPressed,});
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final trashIconController = useAnimationController(
      duration: const Duration(seconds: 1),
      reverseDuration: const Duration(seconds: 1),
    );
    useAnimation(trashIconController);

    return IconButton.outlined(
      padding: const EdgeInsets.all(4.0),
      style: ButtonStyle(
        side: MaterialStateProperty.resolveWith<BorderSide?>((states) {
          if (states.contains(MaterialState.disabled)) {
            return BorderSide(color: Theme.of(context).disabledColor, width: 1.3);
          }
          return BorderSide(color: colorScheme.outline, width: 1.3);
        },
        ),
      ),
      onPressed: onPressed == null ? null : () {
        trashIconController.reset();
        trashIconController.forward();
        onPressed?.call();
      },
        icon: TrashIcon(
        enabled: onPressed != null,
        controller: trashIconController,
      ),
    );
  }
}
