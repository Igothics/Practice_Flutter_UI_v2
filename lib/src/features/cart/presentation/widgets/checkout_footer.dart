import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:practice_food_delivery/src/common_widgets/one_line_info.dart';
import 'package:practice_food_delivery/src/features/cart/presentation/provider/fee_container_provider.dart';
import 'package:practice_food_delivery/src/features/cart/presentation/widgets/checkout_buttons_line.dart';
import 'package:practice_food_delivery/src/features/cart/presentation/widgets/coupon_info_line.dart';
import 'package:practice_food_delivery/src/features/cart/presentation/widgets/payment_type_info_line.dart';
import 'package:practice_food_delivery/src/features/payment/domain/user_balance.dart';

class CheckoutFooter extends HookConsumerWidget {
  const CheckoutFooter({super.key, required this.footerCardKey, required this.userBalance,});
  final GlobalKey footerCardKey;
  final UserBalance userBalance;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;
    final feeContainer = ref.watch(feeContainerProvider);

    return Card(
      key: footerCardKey,
      margin: EdgeInsets.zero,
      elevation: 10.0,
      shape: const ContinuousRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(64.0)),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0, bottom: 8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            OneLineInfo(labelText: 'Balance', infoText: '\$${userBalance.balance}', textStyle: textTheme.bodyMedium,),
            OneLineInfo(labelText: 'Subtotal', infoText: '\$${feeContainer.subtotal}',),
            OneLineInfo(labelText: 'Delivery fee', infoText: '\$${feeContainer.deliveryFee}',),
            OneLineInfo(labelText: 'Tax', infoText: '\$${feeContainer.tax}',),
            const PaymentTypeInfoLine(),
            const CouponInfoLine(),
            OneLineInfo(
              labelText: 'Total',
              infoText: '\$${feeContainer.total}',
              textStyle: textTheme.bodyMedium,
              bottomDivider: false,
            ),
            const SizedBox(height: 4.0,),
            CheckOutButtonsLine(userBalance,),
          ],
        ),
      ),
    );
  }
}
