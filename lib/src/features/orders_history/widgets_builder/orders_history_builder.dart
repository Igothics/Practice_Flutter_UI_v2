import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:practice_food_delivery/src/common_widgets/stored_list_view.dart';
import 'package:practice_food_delivery/src/features/orders_history/domain/user_orders.dart';
import 'package:practice_food_delivery/src/features/orders_history/widgets_builder/order_history_card.dart';

class OrdersHistoryBuilder extends HookConsumerWidget {
  const OrdersHistoryBuilder({
    super.key,
    required this.keyGroup,
    required this.asyncData,
    this.margin = const EdgeInsets.symmetric(vertical: 8.0),
    this.listPadding = const EdgeInsets.symmetric(horizontal: 16.0),
  });
  final String keyGroup;
  final AsyncValue<UserOrder> asyncData;
  final EdgeInsets? margin;
  final EdgeInsets? listPadding;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return asyncData.when(
      error: (error, _) => Text('Error: $error'),
      loading: () => const CircularProgressIndicator(),
      data: (data) {
        final orders = data.orders.reversed.toList();

        return StoredListView(
            storeKey: keyGroup,
            listPadding: listPadding,
            itemCount: orders.length,
            itemBuilder: (_, index) {
              final order = orders[index];
              return OrderHistoryCard(
                  keyGroup: '$keyGroup-$index',
                  order: order,
                  margin: margin,
              );
            },
        );
      },
    );
  }
}