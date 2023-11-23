import 'package:flutter/material.dart';
import 'package:practice_food_delivery/src/common_widgets/info_card.dart';
import 'package:practice_food_delivery/src/common_widgets/one_line_info.dart';
import 'package:practice_food_delivery/src/features/payment/domain/user_balance.dart';
import 'package:practice_food_delivery/src/utils/utils.dart';

class UserBalanceCardBuilder extends StatelessWidget {
  const UserBalanceCardBuilder(
    this.data, {
    super.key,
    this.margin = EdgeInsets.zero,
    this.infoPadding = const EdgeInsets.all(16.0),
  });
  final UserBalance data;
  final EdgeInsets? margin;
  final EdgeInsets? infoPadding;

  @override
  Widget build(BuildContext context) {
    return InfoCard(
      margin: margin,
      infoPadding: infoPadding,
      children: [
        OneLineInfo(
          labelText: 'User balance',
          infoText: '\$${data.balance.toStringAsFixed(2)}',
        ),
        OneLineInfo(
          labelText: 'Create date',
          infoText: formatRecordDate(data.createAt!),
        ),
        OneLineInfo(
          labelText: 'Update date',
          infoText: formatRecordDate(data.updateAt!),
        ),
        OneLineInfo(
          labelText: 'Transfers',
          infoText: '${data.transferLog.length}',
          bottomDivider: false,
        ),
      ],
    );
  }
}
