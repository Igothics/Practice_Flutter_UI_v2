import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:practice_food_delivery/src/common_widgets/cart_icon_fab.dart';
import 'package:practice_food_delivery/src/common_widgets/contrasting_button_pair.dart';
import 'package:practice_food_delivery/src/common_widgets/hero_image.dart';
import 'package:practice_food_delivery/src/common_widgets/favorite_icon_button.dart';
import 'package:practice_food_delivery/src/common_widgets/pop_icon_button.dart';
import 'package:practice_food_delivery/src/common_widgets/standard_title.dart';
import 'package:practice_food_delivery/src/features/restaurant_view/domain/restaurant.dart';
import 'package:practice_food_delivery/src/features/restaurant_view/presentation/providers/menu_provider.dart';
import 'package:practice_food_delivery/src/features/restaurant_view/presentation/widgets/foods_builder.dart';
import 'package:practice_food_delivery/src/features/restaurant_view/presentation/widgets/restaurant_info_builder.dart';

class RestaurantPage extends HookConsumerWidget {
  const RestaurantPage({super.key});
  static const _headerHeight = 216.0;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final restaurant = GoRouterState.of(context).extra as Restaurant;
    final menu = ref.watch(menuProvider(restaurant.uid));

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
            height: _headerHeight,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 8.0,),
                RestaurantInfoBuilder(restaurant,),
                const SizedBox(height: 8.0,),
                _buildButtonPair(colorScheme.onSurfaceVariant),
                const StandardTitle('Menu',),
              ],
            ),
          ),
          Expanded(
            child: FoodsBuilder(
              groupKey: 'food',
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
}
