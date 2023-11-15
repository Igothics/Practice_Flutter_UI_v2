import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:practice_food_delivery/src/common_widgets/standard_title.dart';
import 'package:practice_food_delivery/src/features/home/presentation/user_order_provider.dart';
import 'package:practice_food_delivery/src/features/orders_history/widgets_builder/orders_history_builder.dart';

class OrdersHistory extends HookConsumerWidget {
  const OrdersHistory({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userOrders = ref.watch(userOrdersProvider);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            StandardTitle.asyncValue(
              asyncValue: userOrders,
              extractor: (data) => data.orders.length.toString(),
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              prefix: 'Total: ',
              suffix: ' orders',
            ),
            Expanded(
              child: OrdersHistoryBuilder(
                keyGroup: 'all_order',
                asyncData: userOrders,
                listPadding: EdgeInsets.zero,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
