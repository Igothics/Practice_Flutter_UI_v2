import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:practice_food_delivery/src/common_widgets/cart_icon_fab.dart';
import 'package:practice_food_delivery/src/common_widgets/contrasting_button_pair.dart';
import 'package:practice_food_delivery/src/common_widgets/hero_image.dart';
import 'package:practice_food_delivery/src/common_widgets/favorite_icon_button.dart';
import 'package:practice_food_delivery/src/common_widgets/pop_icon_button.dart';
import 'package:practice_food_delivery/src/common_widgets/standard_title.dart';
import 'package:practice_food_delivery/src/features/home/domain/restaurant.dart';
import 'package:practice_food_delivery/src/common_widgets/rating_stars.dart';
import 'package:practice_food_delivery/src/features/restaurants/presentation/menu_provider.dart';
import 'package:practice_food_delivery/src/features/restaurants/widgets_builder/foods_builder.dart';
import 'package:practice_food_delivery/src/utils/utils.dart';

class RestaurantPage extends HookConsumerWidget {
  const RestaurantPage({super.key, required this.id});
  final String id;
  String get decryptId => decrypt(id);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final restaurant = GoRouterState.of(context).extra as Restaurant;
    final menu = ref.watch(menuProvider(restaurant.uid));
    const headerHeight = 216.0;

    return Scaffold(
      appBar: AppBar(
        leading: const PopIconButton(),
        actions: [FavoriteIconButton(restaurantId: restaurant.id),],
      ),
      floatingActionButton: const CartIconFab(),
      extendBodyBehindAppBar: true,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          HeroImage(
            restaurant.imageUrl,
            heroTag: restaurant.name,
            height: headerHeight,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 8.0,),
                _buildRestaurantInfo(context, restaurant: restaurant),
                const SizedBox(height: 8.0,),
                _buildButtonPair(colorScheme.onSurfaceVariant),
                const StandardTitle('Menu',),
              ],
            ),
          ),
          Expanded(
            child: FoodsBuilder(
              keyGroup: 'food',
              asyncData: menu,
              restaurant: restaurant,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButtonPair(Color seedColor) => ContrastingButtonPair(
    leftTitle: 'Reviews',
    rightTitle: 'Follow',
    gap: 16.0,
    seedColor: seedColor,
    onLeftPressed: (){},
    onRightPressed: (){},
  );
  Widget _buildRestaurantInfo(BuildContext context, {required Restaurant restaurant,}) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              restaurant.name,
              style: textTheme.titleLarge?.copyWith(
                color: colorScheme.onSurface,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Text(
              '${restaurant.distance} miles away',
              style: textTheme.bodyLarge?.copyWith(color: colorScheme.onSurfaceVariant,),
              textAlign: TextAlign.right,
            ),
          ],
        ),
        RatingStars(rating: restaurant.rating,),
        const SizedBox(height: 8.0,),
        Text(
          restaurant.address,
          style: TextStyle(color: colorScheme.onSurfaceVariant,),
        ),
      ],
    );
  }
}
