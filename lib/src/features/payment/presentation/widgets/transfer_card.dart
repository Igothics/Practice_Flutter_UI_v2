import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:practice_food_delivery/src/features/payment/domain/transfer.dart';
import 'package:practice_food_delivery/src/utils/extension.dart';
import 'package:practice_food_delivery/src/utils/utils.dart';

class TransferCard extends StatelessWidget {
  const TransferCard({
    super.key,
    required this.transfer,
    this.margin,
    this.infoPadding = const EdgeInsets.symmetric(horizontal: 16.0),
  });
  final Transfer transfer;
  final EdgeInsets? margin;
  final EdgeInsets? infoPadding;
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final transferId = transfer.id;
    final transferAmount = transfer.amount.toStringAsFixed(2);
    final transferDate = formatRecordDate(transfer.transferDate);

    return Card(
      clipBehavior: Clip.antiAlias,
      margin: margin ?? EdgeInsets.zero,
      child: InkWell(
        onTapUp: (_) => context.goNamed(
          'transfer_detail',
          extra: transfer,
          pathParameters: {'id': '$transferId'},
        ),
        child: ListTile(
          contentPadding: infoPadding ?? EdgeInsets.zero,
          leading: CircleAvatar(
            radius: 16.0,
            backgroundColor: colorScheme.secondaryContainer,
            child: Text('$transferId'),
          ),
          title: Text(transfer.transferType.name.toCapitalize()),
          subtitle: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('\$$transferAmount'),
              Text(transferDate),
            ],
          ),
        ),
      ),
    );
  }
}
