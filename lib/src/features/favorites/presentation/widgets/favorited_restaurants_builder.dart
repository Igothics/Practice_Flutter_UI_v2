import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:practice_food_delivery/src/common_widgets/custom_animation.dart';
import 'package:practice_food_delivery/src/common_widgets/stored_list_view.dart';
import 'package:practice_food_delivery/src/features/favorites/presentation/widgets/favorited_restaurant_card.dart';
import 'package:practice_food_delivery/src/features/restaurant_view/domain/restaurant.dart';

class FavoritedRestaurantBuilder extends StatelessWidget {
  const FavoritedRestaurantBuilder({
    super.key,
    required this.groupKey,
    required this.asyncData,
    this.margin = const EdgeInsets.symmetric(vertical: 8.0),
    this.listPadding = const EdgeInsets.symmetric(horizontal: 16.0),
  });
  final String groupKey;
  final AsyncValue<List<Restaurant>> asyncData;
  final EdgeInsets? margin;
  final EdgeInsets? listPadding;

  @override
  Widget build(BuildContext context) {

    return asyncData.when(
      error: (error, _) => Text('Error: $error'),
      loading: () => const Center(child: CircularProgressIndicator()),
      data: (favoritedRestaurants) {
        return StoredListView(
          storeKey: groupKey,
          listPadding: listPadding,
          itemCount: favoritedRestaurants.length,
          itemBuilder: (_, index) {
            final restaurant = favoritedRestaurants[index];

            return CustomAnimation.fadeSlide(
              delay: 200.ms * index,
              child: FavoritedRestaurantCard(
                groupKey: '$groupKey-$index',
                restaurant: restaurant,
                margin: margin,
              ),
            );
          },
        );
      },
    );
  }
}
