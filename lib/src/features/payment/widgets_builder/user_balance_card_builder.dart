import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:practice_food_delivery/src/common_widgets/info_card.dart';
import 'package:practice_food_delivery/src/common_widgets/one_line_info.dart';
import 'package:practice_food_delivery/src/features/home/presentation/user_balance_provider.dart';
import 'package:practice_food_delivery/src/utils/utils.dart';

class UserBalanceCardBuilder extends HookConsumerWidget {
  const UserBalanceCardBuilder({
    super.key,
    this.margin = EdgeInsets.zero,
    this.infoPadding = const EdgeInsets.all(16.0),
  });

  final EdgeInsets? margin;
  final EdgeInsets? infoPadding;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userBalance = ref.watch(userBalanceProvider);

    return userBalance.when(
      error: (error, _) => Text('Error: $error',),
      loading: () => const CircularProgressIndicator(),
      data: (data) => InfoCard(
        margin: margin,
        infoPadding: infoPadding,
        children: [
          OneLineInfo(labelText: 'User balance', infoText: '\$${data.balance.toStringAsFixed(2)}',),
          OneLineInfo(labelText: 'Create date', infoText: formatRecordDate(data.createAt!),),
          OneLineInfo(labelText: 'Update date', infoText: formatRecordDate(data.updateAt!),),
          OneLineInfo(labelText: 'Transfers', infoText: '${data.transferLog.length}', bottomDivider: false,),
        ],
      ),
    );
  }
}
