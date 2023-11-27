import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lottie/lottie.dart';

class TrashIcon extends HookConsumerWidget {
  const TrashIcon({
    super.key,
    this.enabled = true,
    this.iconSize = 30,
    this.iconColor,
    this.controller,
  });
  final bool enabled;
  final double? iconSize;
  final Color? iconColor;
  final Animation<double>? controller;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final trashIconColor = enabled ? (iconColor ?? colorScheme.onBackground) : Colors.grey;

    return Transform.translate(
      offset: const Offset(0.0, -4),
      child: FittedBox(
        child: Lottie.asset(
          'assets/jsons/trash.json',
          controller: controller,
          width: iconSize,
          height: iconSize,
          delegates: LottieDelegates(
            text: (initialText) => '**$initialText**',
            values: [
              _buildValueDelegate('Layer1_line01', trashIconColor),
              _buildValueDelegate('Layer1_line02', trashIconColor),
            ],
          ),
        ),
      ),
    );
  }
  ValueDelegate _buildValueDelegate(String layerName, Color color) => ValueDelegate.color(
    ['**', layerName, '**',],
    value: color,
  );
}
