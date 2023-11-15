import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:practice_food_delivery/src/common_widgets/cart_icon.dart';
class CartIconFab extends CartIcon {
  const CartIconFab({
    super.key,
    super.iconSize,
    super.iconColor,
    super.badgeColor,
    super.badgeRadius,
    this.backgroundColor,
  });
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;

    return FloatingActionButton(
      backgroundColor: backgroundColor ?? colorScheme.secondaryContainer,
      onPressed: () => context.go('/home/cart'),
      child: super.build(context, ref),
    );
  }
}
