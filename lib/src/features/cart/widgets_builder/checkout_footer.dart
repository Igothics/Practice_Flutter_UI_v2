import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:practice_food_delivery/src/common_provider/item_size_provider.dart';
import 'package:practice_food_delivery/src/common_widgets/check_all_button.dart';
import 'package:practice_food_delivery/src/common_widgets/checkout_button.dart';
import 'package:practice_food_delivery/src/common_widgets/coupon_card.dart';
import 'package:practice_food_delivery/src/common_widgets/one_line_info.dart';
import 'package:practice_food_delivery/src/common_widgets/trash_button.dart';
import 'package:practice_food_delivery/src/constants/enum.dart';
import 'package:practice_food_delivery/src/features/authentication/application/auth_provider.dart';
import 'package:practice_food_delivery/src/features/cart/presentation/active_button_state_provider.dart';
import 'package:practice_food_delivery/src/features/cart/presentation/cart_provider.dart';
import 'package:practice_food_delivery/src/features/cart/presentation/fee_container_provider.dart';
import 'package:practice_food_delivery/src/features/coupons/domain/coupon.dart';
import 'package:practice_food_delivery/src/features/coupons/presentation/chosen_coupon_provider.dart';
import 'package:practice_food_delivery/src/features/coupons/presentation/filtered_coupons_provider.dart';
import 'package:practice_food_delivery/src/features/coupons/presentation/selected_coupon_index_provider.dart';
import 'package:practice_food_delivery/src/features/home/presentation/user_balance_provider.dart';
import 'package:practice_food_delivery/src/features/payment/presentation/payment_type_provider.dart';
import 'package:practice_food_delivery/src/utils/utils.dart';

class CheckoutFooter extends HookConsumerWidget {
  const CheckoutFooter({
    super.key,
    required this.cardKey,
  });

  final GlobalKey cardKey;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    final userId = ref.watch(authProvider).currentUser?.id;
    final cartController = ref.watch(cartProvider(userId).notifier);
    final inactiveItemFound = ref.watch(inactiveItemFoundProvider);
    final feeContainer = ref.watch(feeContainerProvider);
    final userBalance = ref.watch(userBalanceProvider);
    final paymentType = ref.watch(paymentTypeProvider(userId));
    final chosenCoupon = ref.watch(chosenCouponProvider(userId));

    final (available, _) = ref.watch(filteredCouponsProvider);
    final selected = ref.watch(selectedCouponIndexProvider(userId));

    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        final renderObject = cardKey.currentContext?.findRenderObject();
        if (renderObject != null) {
          final renderBox = renderObject as RenderBox;
          ref.read(alwaysAliveSizeProvider.notifier).update((state) {
            log('[useSizeDefine "$cardKey"]: ${renderBox.size.height}');
            return renderBox.size;
          });
        } else {
          log('[useSizeDefine "$cardKey"]: null!');
        }
      },);
      return null;
    }, [userBalance]);

    return userBalance.when(
      error: (error, _) => Text('Error: $error'),
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
      data: (data) => Card(
        key: cardKey,
        margin: EdgeInsets.zero,
        elevation: 10.0,
        shape: const ContinuousRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(64.0)),
        ),
        child: Padding(
          padding: const EdgeInsets.only(
              top: 16.0, left: 16.0, right: 16.0, bottom: 8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              OneLineInfo(labelText: 'Balance', infoText: '\$${data.balance.toStringAsFixed(2)}', textStyle: textTheme.bodyMedium,),
              OneLineInfo(labelText: 'Subtotal', infoText: '\$${feeContainer.subtotal.toStringAsFixed(2)}',),
              OneLineInfo(labelText: 'Delivery fee', infoText: '\$${feeContainer.deliveryFee.toStringAsFixed(2)}',),
              OneLineInfo(labelText: 'Tax', infoText: '\$${feeContainer.tax.toStringAsFixed(2)}',),

              OneLineInfo(
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
              ),
              OneLineInfo(
                label: Row(
                  children: [
                    InkWell(
                      onTap: () async {
                        final dialogItems =
                            List.generate(available.length, (index) {
                          final coupon = available.keys.elementAt(index);
                          final count = available.values.elementAt(index);
                          final title = _buildTitles(coupon);
                          final subtitle =
                              'EXP: ${formatRecordDate(coupon.expirationDate)}';
                          final icon = coupon.feeType.icon;
                          final trailing = '$count / ${coupon.maxUsageCount}';

                          return SimpleDialogOption(
                            onPressed: () => context.pop((index, coupon)),
                            padding: EdgeInsets.zero,
                            child: CouponCard(
                              selected: selected == index,
                              margin: const EdgeInsets.symmetric(vertical: 4.0),
                              infoPadding: const EdgeInsets.symmetric(
                                  horizontal: 12.0, vertical: 8.0),
                              cardId: 'dialog_coupon-$index',
                              icon: Icon(icon, color: colorScheme.onPrimaryContainer,),
                              titles: [Text(title,)],
                              subtitles: [Text(subtitle,)],
                              trailing: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [const Text('Used',), Text(trailing,),],
                              ),
                              onPressed: null,
                            ),
                          );
                        });

                        final (int index, Coupon coupon) = await showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (_) => SimpleDialog(
                            elevation: 1.0,
                            contentPadding: const EdgeInsets.all(16.0),
                            title: const Text('Select coupon'),
                            children: dialogItems,
                          ),
                        );
                        ref.read(chosenCouponProvider(userId).notifier).update((state) => coupon);
                        ref.read(selectedCouponIndexProvider(userId).notifier).update((state) => index);
                      },
                      child: _buildCouponStatus(chosenCoupon, feeContainer.subtotal),
                    ),
                    const SizedBox(width: 8.0,),
                    InkWell(
                      onTap: () {
                        ref.refresh(chosenCouponProvider(userId));
                        ref.refresh(selectedCouponIndexProvider(userId));
                      },
                      child: Icon(Icons.clear_outlined, size: 18.0, color: colorScheme.onSurfaceVariant,),
                    ),
                  ],
                ),
                infoText: '-\$${feeContainer.discount.toStringAsFixed(2)}',
              ),
              OneLineInfo(
                labelText: 'Total',
                infoText: '\$${feeContainer.total.toStringAsFixed(2)}',
                textStyle: textTheme.bodyMedium,
                bottomDivider: false,
              ),
              const SizedBox(height: 4.0,),
              Row(
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
                    onPressed: !inactiveItemFound
                        ? null
                        : () => cartController.purgeInactiveItems(),
                  ),
                  const SizedBox(
                    width: 16.0,
                  ),
                  Expanded(
                    child: CheckoutButton(
                      enabled: feeContainer.total > 0.0,
                      failCheckValue: (userBalance.value?.balance ?? 0.0) -
                          feeContainer.total,
                      executeCallback: () =>
                          cartController.checkOut(feeContainer),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _buildTitles(Coupon coupon) => switch (coupon) {
        CouponPercentage data =>
          'Discount ${data.value * 100}% on ${data.feeType.value} up to \$${data.maxDiscount}\nWhen orders reach \$${data.minimumSpend}',
        CouponFixValue data =>
          'Discount \$${data.value} on ${data.feeType.value}\nWhen orders reach \$${data.minimumSpend}',
        CouponFreeCharge data =>
          'Free charge on ${data.feeType.value}\nWhen orders reach \$${data.minimumSpend}',
      };

  String _buildCouponText(Coupon coupon) => switch (coupon) {
        CouponPercentage data =>
          'Discount ${data.value * 100}% on ${data.feeType.value}',
        CouponFixValue data =>
          'Discount \$${data.value} on ${data.feeType.value}',
        CouponFreeCharge data => 'Free charge on ${data.feeType.value}',
      };

  Widget _buildCouponStatus(Coupon? coupon, double subtotal) {
    if (coupon != null) {
      if (subtotal >= coupon.minimumSpend) {
        return Row(
          children: [
            const Icon(
              Icons.confirmation_num,
              color: Colors.green,
            ),
            Text(
              ' ${_buildCouponText(coupon)}',
              style: const TextStyle(color: Colors.green,),
            ),
          ],
        );
      }
      return Row(
        children: [
          const Icon(Icons.confirmation_num, color: Colors.redAccent,),
          Text(
            ' Subtotal must reach \$${coupon.minimumSpend}',
            style: const TextStyle(color: Colors.redAccent,),
          ),
        ],
      );
    }
    return const Row(
      children: [
        Icon(
          Icons.confirmation_num_outlined,
          color: Colors.grey,
        ),
        Text(
          ' Choose Coupon',
          style: TextStyle(color: Colors.grey,),
        ),
      ],
    );
  }
}
