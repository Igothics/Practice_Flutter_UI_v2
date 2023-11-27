import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:practice_food_delivery/src/common_widgets/check_all_button.dart';
import 'package:practice_food_delivery/src/common_widgets/checkout_button.dart';
import 'package:practice_food_delivery/src/common_widgets/trash_button.dart';
import 'package:practice_food_delivery/src/features/authentication/application/auth_serviced_provider.dart';
import 'package:practice_food_delivery/src/features/cart/application/cart_service_provider.dart';
import 'package:practice_food_delivery/src/features/cart/presentation/provider/fee_container_provider.dart';
import 'package:practice_food_delivery/src/features/cart/presentation/provider/inactive_item_found_provider.dart';
import 'package:practice_food_delivery/src/features/payment/domain/user_balance.dart';

class CheckOutButtonsLine extends HookConsumerWidget {
  const CheckOutButtonsLine(this.userBalance, {super.key,});
  final UserBalance userBalance;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userId = ref.watch(authServiceProvider).currentUser?.id;
    final cartController = ref.watch(cartServiceProvider(userId).notifier);
    final inactiveItemFound = ref.watch(inactiveItemFoundProvider);
    final cartItemsCount = ref.watch(cartServiceProvider(userId)).length;
    final feeContainer = ref.watch(feeContainerProvider);

    return Row(
      children: [
        CheckAllButton(
          value: !inactiveItemFound,
          onChanged: (value) {
            if (value!) {
              cartController.activateAll();
            } else {
              cartController.deActivateAll();
            }
          },
        ),
        TrashButton(
          onPressed: !inactiveItemFound || cartItemsCount <= 0 ? null : () => cartController.purgeInactiveItems(),
        ),
        const SizedBox(width: 16.0,),
        Expanded(
          child: CheckoutButton(
            enabled: feeContainer.total > 0.0,
            failCheckValue: userBalance.balance - feeContainer.total,
            executeCallback: () => cartController.checkOut(feeContainer),
          ),
        ),
      ],
    );
  }
}
