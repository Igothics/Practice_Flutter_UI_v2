import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:practice_food_delivery/src/common_widgets/add_to_cart_icon.dart';
import 'package:practice_food_delivery/src/features/authentication/application/auth_serviced_provider.dart';
import 'package:practice_food_delivery/src/features/cart/application/cart_service_provider.dart';
import 'package:practice_food_delivery/src/features/restaurant_view/domain/restaurant.dart';
import 'package:practice_food_delivery/src/features/orders_history/domain/order.dart';
import 'package:practice_food_delivery/src/features/restaurant_view/domain/food.dart';
class AddToCartButton extends HookConsumerWidget {
  const AddToCartButton({super.key, required this.newOrder, this.iconSize,});
  final Order newOrder;
  final double? iconSize;

  factory AddToCartButton.fromOrder(Order order) {
    final newOrder = order.copyWith(quantity: 1,);
    return AddToCartButton(newOrder: newOrder);
  }
  factory AddToCartButton.fromFoodAndRestaurant(Food food, Restaurant restaurant){
    final newOrder = Order(
      imageUrl: food.imageUrl,
      restaurantName: restaurant.name,
      distance: restaurant.distance,
      foodName: food.name,
      quantity: 1,
      price: food.price,
    );
    return AddToCartButton(newOrder: newOrder);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authServiceProvider).currentUser;
    final cartController = ref.read(cartServiceProvider(user?.id).notifier);
    final plusIconController = useAnimationController(
      duration: const Duration(seconds: 1),
      reverseDuration: const Duration(seconds: 1),
    );
    useAnimation(plusIconController);

    return IconButton.filledTonal(
      iconSize: iconSize,
      onPressed: () {
        plusIconController.reset();
        plusIconController.forward();
        cartController.addItemFromOrder(newOrder);
      },
      icon: AddToCartIcon(controller: plusIconController,),
    );
  }
}
