import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CheckAllButton extends HookConsumerWidget {
  const CheckAllButton({super.key, this.value, this.onChanged,});
  final bool? value;
  final void Function(bool?)? onChanged;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;

    return Stack(
      children:[
        Transform.scale(
          scale: 1.8,
          child: Checkbox(
            shape: const CircleBorder(),
            side: BorderSide(width: 0.6, color: colorScheme.onSecondaryContainer,),
            activeColor: Colors.transparent,
            checkColor: colorScheme.onSecondaryContainer,
            value: value,
            onChanged: onChanged,
          ),
        ),
      ],
    );
  }
}
