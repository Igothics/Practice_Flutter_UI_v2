import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:practice_food_delivery/src/common_widgets/one_line_info.dart';
import 'package:practice_food_delivery/src/constants/enum.dart';
import 'package:practice_food_delivery/src/features/authentication/application/auth_serviced_provider.dart';
import 'package:practice_food_delivery/src/features/payment/presentation/providers/payment_type_provider.dart';

class PaymentTypeInfoLine extends HookConsumerWidget {
  const PaymentTypeInfoLine({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userId = ref.watch(authServiceProvider).currentUser?.id;
    final paymentType = ref.watch(paymentTypeProvider(userId));

    return OneLineInfo(
      labelText: 'Payment Type',
      info: PopupMenuButton(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0)),
        initialValue: paymentType,
        onSelected: (value) => ref
            .read(paymentTypeProvider(userId).notifier)
            .update((state) => value),
        child: Text(paymentType.value),
        itemBuilder: (_) => [
          const PopupMenuItem(
            value: PaymentType.credit,
            child: Text('Credit'),
          ),
          const PopupMenuItem(
            value: PaymentType.cash,
            child: Text('Cash'),
          ),
          const PopupMenuItem(
            value: PaymentType.coin,
            child: Text('Coin'),
          ),
        ],
      ),
    );
  }
}
