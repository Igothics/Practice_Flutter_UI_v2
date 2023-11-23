import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:practice_food_delivery/src/common_widgets/standard_title.dart';
import 'package:practice_food_delivery/src/features/orders_history/presentation/providers/user_order_provider.dart';
import 'package:practice_food_delivery/src/features/orders_history/presentation/widgets/orders_history_builder.dart';

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
            userOrders.when(
              error: (error, _) => const StandardTitle('Error!',),
              loading: () => const StandardTitle('loading...', prefix: 'Total: ',),
              data: (data) => StandardTitle(
                '${data.orders.length}',
                prefix: 'Total: ',
                suffix: ' orders',
              ),
            ),
            Expanded(
              child: OrdersHistoryBuilder(
                groupKey: 'order_history',
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
