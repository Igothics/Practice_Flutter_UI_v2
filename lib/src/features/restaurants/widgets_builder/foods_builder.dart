import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:practice_food_delivery/src/common_widgets/stored_grid_view.dart';
import 'package:practice_food_delivery/src/features/home/domain/restaurant.dart';
import 'package:practice_food_delivery/src/features/restaurants/domain/menu.dart';
import 'package:practice_food_delivery/src/features/restaurants/widgets_builder/food_card.dart';

class FoodsBuilder extends HookConsumerWidget {
  const FoodsBuilder({
    super.key,
    required this.keyGroup,
    required this.asyncData,
    required this.restaurant,
    this.innerGap = 8.0,
    this.gridPadding = const EdgeInsets.symmetric(horizontal: 16.0),
  });
  final String keyGroup;
  final AsyncValue<Menu> asyncData;
  final Restaurant restaurant;
  final double? innerGap;
  final EdgeInsets? gridPadding;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return asyncData.when(
      error: (error, _) => Text('Error: $error'),
      loading: () => const CircularProgressIndicator(),
      data: (data) => StoredGridView(
          storeKey: keyGroup,
          gap: innerGap,
          gridPadding: gridPadding,
          itemCount: data.foods.length,
          itemBuilder: (_, index) {
            final food = data.foods[index];
            return FoodCard(
              keyGroup: '$keyGroup-$index',
              food: food,
              restaurant: restaurant,
            );
          },
      ),
    );
  }
}
