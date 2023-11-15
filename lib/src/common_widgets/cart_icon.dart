import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:practice_food_delivery/src/features/cart/presentation/cart_items_count_provider.dart';

class CartIcon extends HookConsumerWidget {
  const CartIcon({
    super.key,
    this.iconSize = 32,
    this.iconColor,
    this.badgeColor,
    this.badgeRadius = 10,
  });
  final double? iconSize;
  final Color? iconColor;
  final Color? badgeColor;
  final double? badgeRadius;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final cartItemsCount = ref.watch(cartItemsCountProvider);
    final fontSize = badgeRadius != null ? badgeRadius! * 1.3 : null;

    return Stack(
      clipBehavior: Clip.none,
      children: [
        Icon(
          Icons.shopping_cart,
          size: iconSize,
          color: iconColor,
        ),
        Positioned(
          top: -8.0,
          right: -8.0,
          child: CircleAvatar(
            backgroundColor: badgeColor ?? colorScheme.primaryContainer,
            radius: badgeRadius,
            child: Text(
              '$cartItemsCount',
              style: TextStyle(fontSize: fontSize),
            ),
          ),
        ),
      ],
    );
  }
}
