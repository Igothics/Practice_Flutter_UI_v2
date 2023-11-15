import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:practice_food_delivery/src/features/authentication/application/auth_provider.dart';
import 'package:practice_food_delivery/src/features/cart/presentation/cart_provider.dart';
import 'package:practice_food_delivery/src/features/home/domain/restaurant.dart';
import 'package:practice_food_delivery/src/features/orders_history/domain/order.dart';
import 'package:practice_food_delivery/src/features/restaurants/domain/food.dart';
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
    final user = ref.watch(authProvider).currentUser;
    final cartController = ref.read(cartProvider(user?.id).notifier);

    return IconButton.filledTonal(
      iconSize: iconSize,
      onPressed: () => cartController.addItemFromOrder(newOrder),
      icon: const Icon(Icons.add,),
    );
  }
}
