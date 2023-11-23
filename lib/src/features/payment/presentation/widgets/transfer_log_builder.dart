import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:practice_food_delivery/src/common_widgets/stored_list_view.dart';
import 'package:practice_food_delivery/src/features/payment/domain/transfer.dart';
import 'package:practice_food_delivery/src/features/payment/presentation/widgets/transfer_card.dart';

class TransferLogBuilder extends HookConsumerWidget {
  const TransferLogBuilder({
    super.key,
    required this.data,
    required this.groupKey,
    this.margin = const EdgeInsets.symmetric(vertical: 4.0),
    this.listPadding = const EdgeInsets.symmetric(horizontal: 16.0),
    this.listHeight = 728,
  });

  final List<Transfer> data;
  final String groupKey;
  final EdgeInsets? margin;
  final EdgeInsets? listPadding;
  final double? listHeight;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final transfers = data.reversed.toList();

    return SizedBox(
      height: listHeight,
      child: StoredListView(
        storeKey: groupKey,
        listPadding: listPadding,
        itemCount: transfers.length,
        itemBuilder: (_, index) {
          final transfer = transfers[index];

          return TransferCard(
            transfer: transfer,
            margin: margin,
          );
        },
      ),
    );
  }
}
