import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:practice_food_delivery/src/utils/utils.dart';
import 'package:dynamic_color/dynamic_color.dart';

class RoundTextAvatar extends HookConsumerWidget {
  const RoundTextAvatar({super.key, required this.label,this.radius, this.labelTextStyle, this.background,});
  final String label;
  final double? radius;
  final TextStyle? labelTextStyle;
  final Color? background;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final harmonizedBackground = background?.harmonizeWith(colorScheme.primary);
    final randomColor = getHarmonizedRandomColor(colorScheme.primary);
    final chosenColor = harmonizedBackground ?? randomColor;
    final textColor = chosenColor.computeLuminance() < 0.4 ? colorScheme.onBackground : colorScheme.background;
    final textStyle = labelTextStyle?.copyWith(color: textColor) ?? TextStyle(color: textColor,);

    return CircleAvatar(
      radius: radius,
      backgroundColor: chosenColor,
      child: Text(label[0], style: textStyle,),
    );
  }
}
