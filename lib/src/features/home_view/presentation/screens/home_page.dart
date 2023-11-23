import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:practice_food_delivery/src/common_widgets/standard_title.dart';
import 'package:practice_food_delivery/src/features/home_view/presentation/providers/restaurants_provider.dart';
import 'package:practice_food_delivery/src/features/home_view/presentation/widgets/finding_text_field.dart';
import 'package:practice_food_delivery/src/features/home_view/presentation/widgets/recent_orders_builder.dart';
import 'package:practice_food_delivery/src/features/home_view/presentation/widgets/restaurants_builder.dart';
import 'package:practice_food_delivery/src/features/orders_history/presentation/providers/user_order_provider.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userOrders = ref.watch(userOrdersProvider);
    final restaurants = ref.watch(restaurantsProvider);

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 8.0,),
                FindingTextFieldBuilder(),
                StandardTitle('Recent Orders'),
                SizedBox(height: 8.0,),
              ],
            ),
          ),
          SizedBox(
            height: 96,
            child: RecentOrdersBuilder(
              groupKey: 'recent_order',
              asyncData: userOrders,
            ),
          ),
          const SizedBox(height: 16.0,),
          const StandardTitle(
            'Nearby Restaurants',
            padding: EdgeInsets.symmetric(horizontal: 16.0),
          ),
          Expanded(
            child: RestaurantsBuilder(
              groupKey: 'restaurant',
              asyncData: restaurants,
            ),
          ),
        ],
      ),
    );
  }
}
