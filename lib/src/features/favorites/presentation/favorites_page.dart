import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:practice_food_delivery/src/common_widgets/standard_title.dart';
import 'package:practice_food_delivery/src/features/favorites/widgets_builder/favorited_restaurants_builder.dart';
import 'package:practice_food_delivery/src/features/favorites/presentation/favorited_restaurants_provider.dart';

class FavoritesPage extends HookConsumerWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoritedRestaurants = ref.watch(favoritedRestaurantsProvider);

    return Scaffold(
      body:Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            StandardTitle(
              favoritedRestaurants.length.toString(),
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              prefix: 'Total: ',
              suffix: ' restaurants',
            ),
            Expanded(
              child: FavoritedRestaurantBuilder(
                keyGroup: 'favorite',
                favoritedRestaurants: favoritedRestaurants,
                listPadding: EdgeInsets.zero,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
