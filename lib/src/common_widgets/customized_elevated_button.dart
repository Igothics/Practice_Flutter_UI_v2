import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    this.enable = true,
    required this.onPressed,
    required this.child,
    this.backgroundColor,
    this.foregroundColor,
  });
  final bool enable;
  final VoidCallback? onPressed;
  final Widget? child;
  final Color? backgroundColor;
  final Color? foregroundColor;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor ?? colorScheme.primaryContainer,
        foregroundColor: foregroundColor ?? colorScheme.background,
      ),
      onPressed: enable ? onPressed : null,
      child: child,
    );
  }
}
