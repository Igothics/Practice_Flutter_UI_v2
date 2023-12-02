import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:practice_food_delivery/src/common_widgets/count_up_title.dart';
import 'package:practice_food_delivery/src/common_widgets/standard_title.dart';
import 'package:practice_food_delivery/src/features/favorites/presentation/providers/favorited_restaurants_provider.dart';
import 'package:practice_food_delivery/src/features/favorites/presentation/widgets/favorited_restaurants_builder.dart';

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
            favoritedRestaurants.when(
              error: (error, _) => const StandardTitle('Error!',),
              loading: () => const StandardTitle('loading...', prefix: 'Total: ',),
              data: (data) => CountUp.title(
                context,
                data.length,
                prefix: 'Total: ',
                suffix: ' restaurants',
              ),
            ),
            Expanded(
              child: FavoritedRestaurantBuilder(
                groupKey: 'favorite',
                asyncData: favoritedRestaurants,
                listPadding: EdgeInsets.zero,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
