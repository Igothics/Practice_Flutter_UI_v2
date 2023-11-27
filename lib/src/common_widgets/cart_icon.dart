import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:practice_food_delivery/src/common_use_hook/use_create_animation.dart';
import 'package:practice_food_delivery/src/common_widgets/custom_animation.dart';
import 'package:practice_food_delivery/src/features/authentication/application/auth_serviced_provider.dart';
import 'package:practice_food_delivery/src/features/cart/application/cart_service_provider.dart';

class CartIcon extends HookConsumerWidget {
  const CartIcon({
    super.key,
    this.iconSize = 36,
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
    final userId = ref.watch(authServiceProvider).currentUser?.id;
    final cartItemsCount = ref.watch(cartServiceProvider(userId)).length;
    final fontSize = badgeRadius != null ? badgeRadius! * 1.3 : null;
    final cartIconColor = iconColor ?? colorScheme.onBackground;
    final badgeIconColor = badgeColor ?? colorScheme.primaryContainer;
    final iconAnimationController = useCreateAnimation(listenedValue: cartItemsCount, duration: 1.seconds);
    final textAnimationController = useCreateAnimation(listenedValue: cartItemsCount,);

    return Stack(
      clipBehavior: Clip.none,
      children: [
        FittedBox(
          child: Lottie.asset(
            'assets/jsons/cart.json',
            controller: iconAnimationController,
            width: iconSize,
            height: iconSize,
            delegates: LottieDelegates(
              text: (initialText) => '**$initialText**',
              values: [
                _buildValueDelegate('Layer1_line01', cartIconColor),
                _buildValueDelegate('Layer1_line02', cartIconColor),
                _buildValueDelegate('Layer1_line03', cartIconColor),
                _buildValueDelegate('Layer1_line04', cartIconColor),
              ],
            ),
          ),
        ),
        Positioned(
          top: -6.0,
          right: -6.0,
          child: CustomAnimation.shake(
            controller: textAnimationController,
            child: CircleAvatar(
              backgroundColor: badgeIconColor,
              radius: badgeRadius,
              child: Text(
                '$cartItemsCount',
                style: TextStyle(fontSize: fontSize),
              ),
            ),
          ),
        ),
      ],
    );
  }
  ValueDelegate _buildValueDelegate(String layerName, Color color) => ValueDelegate.strokeColor(
    ['**', layerName, '**',],
    value: color,
  );
}
