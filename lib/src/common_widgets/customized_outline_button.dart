import 'package:flutter/material.dart';

class CustomOutlineButton extends StatelessWidget {
  const CustomOutlineButton({
    super.key,
    this.enable = true,
    required this.onPressed,
    required this.child,
    this.borderColor,
    this.foregroundColor,
  });
  final bool enable;
  final VoidCallback? onPressed;
  final Widget? child;
  final Color? borderColor;
  final Color? foregroundColor;
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        foregroundColor: foregroundColor ?? colorScheme.inversePrimary,
        side: enable ? BorderSide(color: borderColor ?? colorScheme.inversePrimary) : null,
      ),
      onPressed: enable ? onPressed : null,
      child: child,
    );
  }
}
