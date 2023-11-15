import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:practice_food_delivery/src/common_widgets/stored_list_view.dart';
import 'package:practice_food_delivery/src/common_widgets/view_more_button.dart';
import 'package:practice_food_delivery/src/features/home/widgets_builder/recent_order_card.dart';
import 'package:practice_food_delivery/src/features/orders_history/domain/user_orders.dart';

class RecentOrdersBuilder extends HookConsumerWidget {
  const RecentOrdersBuilder({
    super.key,
    required this.keyGroup,
    required this.asyncData,
    this.limit = 3,
    this.cardWidth = 296,
    this.margin = const EdgeInsets.symmetric(horizontal: 8.0,),
    this.listPadding = const EdgeInsets.symmetric(horizontal: 8.0,),
  }) : assert(limit == null || limit >= 0, 'limit is null or must >= 0');
  final String keyGroup;
  final AsyncValue<UserOrder> asyncData;
  final int? limit; // limit = null mean no limit, show all
  final double? cardWidth;
  final EdgeInsets? margin;
  final EdgeInsets? listPadding;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return asyncData.when(
      error: (error, _) => Text('Error: $error'),
      loading: () => const CircularProgressIndicator(),
      data: (data) {
        final orders = data.orders.reversed.toList();
        final itemCount = orders.length > (limit ?? orders.length) ? limit! : orders.length;

        return StoredListView(
          storeKey: keyGroup,
          listPadding: listPadding,
          itemCount: itemCount < orders.length ? itemCount + 1 : itemCount,
          direction: Axis.horizontal,
          itemBuilder: (_, index) {
            final order = orders[index];
            if (index == itemCount) {
              return const ViewMoreButton(goToLocation: '/orders_history',);
            }
            return RecentOrderCard(
              keyGroup: '$keyGroup-$index',
              order: order,
              cardWidth: cardWidth,
              margin: margin,
            );
          },
        );
      },
    );
  }
}