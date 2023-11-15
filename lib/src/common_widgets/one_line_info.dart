import 'package:flutter/material.dart';

class OneLineInfo extends StatelessWidget {
  const OneLineInfo({
    super.key,
    this.labelText = '',
    this.infoText = '',
    this.topDivider = false,
    this.bottomDivider = true,
    this.textStyle,
    this.label,
    this.info,
  });
  final Widget? label;
  final Widget? info;
  final String labelText;
  final String infoText;
  final bool topDivider;
  final bool bottomDivider;
  final TextStyle? textStyle;
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    final defaultTextStyle = textTheme.bodySmall?.copyWith(color: colorScheme.onSurface,);

    return Column(
      children: [
        Visibility(visible: topDivider, child: const Divider()),
        DefaultTextStyle(
          style: defaultTextStyle!.merge(textStyle),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              label ?? Text(labelText,),
              info ?? Text(infoText,),
            ],
          ),
        ),
        Visibility(visible: bottomDivider, child: const Divider()),
      ],
    );
  }
}
