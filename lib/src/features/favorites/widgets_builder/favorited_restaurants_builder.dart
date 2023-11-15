import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:practice_food_delivery/src/common_widgets/stored_list_view.dart';
import 'package:practice_food_delivery/src/features/favorites/widgets_builder/favorited_restaurant_card.dart';
import 'package:practice_food_delivery/src/features/home/domain/restaurant.dart';

class FavoritedRestaurantBuilder extends HookConsumerWidget {
  const FavoritedRestaurantBuilder({
    super.key,
    required this.keyGroup,
    required this.favoritedRestaurants,
    this.margin = const EdgeInsets.symmetric(vertical: 8.0),
    this.listPadding = const EdgeInsets.symmetric(horizontal: 16.0),
  });
  final String keyGroup;
  final Map<String, Restaurant> favoritedRestaurants;
  final EdgeInsets? margin;
  final EdgeInsets? listPadding;
  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return StoredListView(
      storeKey: keyGroup,
      listPadding: listPadding,
      itemCount: favoritedRestaurants.length,
      itemBuilder: (_, index) {
        final restaurant = favoritedRestaurants.values.elementAt(index);
        return FavoritedRestaurantCard(
          keyGroup: '$keyGroup-$index',
          restaurant: restaurant,
          margin: margin,
        );
      },
    );
  }
}
