import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:practice_food_delivery/src/common_widgets/stored_list_view.dart';
import 'package:practice_food_delivery/src/features/home/domain/restaurant.dart';
import 'package:practice_food_delivery/src/features/home/widgets_builder/restaurant_card.dart';

class RestaurantsBuilder extends HookConsumerWidget {
  const RestaurantsBuilder({
    super.key,
    required this.keyGroup,
    required this.asyncData,
    this.margin = const EdgeInsets.symmetric(vertical: 8.0,),
    this.listPadding = const EdgeInsets.symmetric(horizontal: 16.0),
  });
  final String keyGroup;
  final AsyncValue<Map<String, Restaurant>> asyncData;
  final EdgeInsets? margin;
  final EdgeInsets? listPadding;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return asyncData.when(
      error: (error, _) => Text('Error: $error'),
      loading: () => const CircularProgressIndicator(),
      data: (data) => StoredListView(
          storeKey: keyGroup,
          itemCount: data.length,
          listPadding: listPadding,
          itemBuilder: (_, index) {
            final restaurant = data.values.elementAt(index);
            return RestaurantCard(
              cardId: '$keyGroup-$index',
              restaurant: restaurant,
              margin: margin,
            );
          },
      ),
    );
  }
}
