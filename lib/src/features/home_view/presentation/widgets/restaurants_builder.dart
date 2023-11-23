import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:practice_food_delivery/src/common_widgets/stored_list_view.dart';
import 'package:practice_food_delivery/src/features/home_view/presentation/widgets/restaurant_card.dart';
import 'package:practice_food_delivery/src/features/restaurant_view/domain/restaurant.dart';

class RestaurantsBuilder extends StatelessWidget {
  const RestaurantsBuilder({
    super.key,
    required this.groupKey,
    required this.asyncData,
    this.margin = const EdgeInsets.symmetric(vertical: 8.0,),
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
      data: (restaurants) => StoredListView(
          storeKey: groupKey,
          itemCount: restaurants.length,
          listPadding: listPadding,
          itemBuilder: (_, index) {
            final restaurant = restaurants[index];

            return RestaurantCard(
              cardId: '$groupKey-$index',
              restaurant: restaurant,
              margin: margin,
            );
          },
      ),
    );
  }
}
