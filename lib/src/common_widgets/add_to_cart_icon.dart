import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lottie/lottie.dart';

class AddToCartIcon extends HookConsumerWidget {
  const AddToCartIcon({
    super.key,
    this.iconSize = 24,
    this.iconColor,
    this.controller,
  });
  final double? iconSize;
  final Color? iconColor;
  final Animation<double>? controller;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final plusIconColor = iconColor ?? colorScheme.onBackground;

    return FittedBox(
      child: Lottie.asset(
        'assets/jsons/plus.json',
        controller: controller,
        width: iconSize,
        height: iconSize,
        delegates: LottieDelegates(
          text: (initialText) => '**$initialText**',
          values: [
            _buildValueDelegate('Layer1_line01', plusIconColor),
            _buildValueDelegate('Layer1_line02', plusIconColor),
          ],
        ),
      ),
    );
  }
  ValueDelegate _buildValueDelegate(String layerName, Color color) => ValueDelegate.strokeColor(
    ['**', layerName, '**',],
    value: color,
  );
}
