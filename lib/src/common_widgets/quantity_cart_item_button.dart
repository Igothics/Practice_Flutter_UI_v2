import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class QuantityCartItemButton extends HookConsumerWidget {
  const QuantityCartItemButton({super.key, this.quantity = 1, this.onAddPressed, this.onSubtractPressed,});
  final int quantity;
  final VoidCallback? onAddPressed;
  final VoidCallback? onSubtractPressed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          onPressed: onSubtractPressed,
          icon: const Icon(Icons.remove,),
        ),
        Text('$quantity', style: textTheme.bodyLarge,),
        IconButton(
          onPressed: onAddPressed,
          icon: const Icon(Icons.add,),
        ),
      ],
    );
  }
}
