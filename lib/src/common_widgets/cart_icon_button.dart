import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:practice_food_delivery/src/common_widgets/cart_icon.dart';
class CartIconButton extends CartIcon {
  const CartIconButton({
    super.key,
    super.iconSize,
    super.iconColor,
    super.badgeColor,
    super.badgeRadius,
    this.padding,
  });
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return Padding(
      padding: padding ?? const EdgeInsets.only(top: 8.0, right: 16.0),
      child: IconButton(
        onPressed: () => context.go('/home/cart'),
        icon: super.build(context, ref),
      ),
    );
  }
}
