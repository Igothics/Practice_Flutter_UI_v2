import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:practice_food_delivery/src/common_widgets/cart_icon.dart';
class CartIconFab extends StatelessWidget {
  const CartIconFab({
    super.key,
    this.backgroundColor,
  });
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return FloatingActionButton(
      backgroundColor: backgroundColor ?? colorScheme.secondaryContainer,
      onPressed: () => context.go('/home/cart'),
      child: const CartIcon(),
    );
  }
}
