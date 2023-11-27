import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:practice_food_delivery/src/common_widgets/cart_icon.dart';
class CartIconButton extends StatelessWidget {

  const CartIconButton({
    super.key,
    this.padding,
  });
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: padding ?? const EdgeInsets.all(8.0),
      child: IconButton(
        onPressed: () => context.go('/home/cart'),
        padding: EdgeInsets.zero,
        icon: const CartIcon(),
      ),
    );
  }
}
