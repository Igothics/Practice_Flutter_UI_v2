import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:practice_food_delivery/src/common_widgets/one_line_info.dart';
import 'package:practice_food_delivery/src/features/authentication/application/auth_serviced_provider.dart';
import 'package:practice_food_delivery/src/features/cart/presentation/provider/fee_container_provider.dart';
import 'package:practice_food_delivery/src/features/cart/presentation/widgets/coupon_status.dart';
import 'package:practice_food_delivery/src/features/cart/presentation/widgets/select_coupon_dialog.dart';
import 'package:practice_food_delivery/src/features/coupon_box/domain/coupon.dart';
import 'package:practice_food_delivery/src/features/coupon_box/presentation/providers/chosen_coupon_provider.dart';
import 'package:practice_food_delivery/src/features/coupon_box/presentation/providers/selected_coupon_index_provider.dart';

class CouponInfoLine extends HookConsumerWidget {
  const CouponInfoLine({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final userId = ref.watch(authServiceProvider).currentUser?.id;
    final chosenCoupon = ref.watch(chosenCouponProvider(userId));
    final feeContainer = ref.watch(feeContainerProvider);

    return OneLineInfo(
      label: Row(
        children: [
          InkWell(
            onTap: () async {
              final (int, Coupon)? result = await showDialog(
                context: context,
                barrierDismissible: true,
                builder: (_) => const SelectCouponDialog(),
              );
              if (result != null) {
                final index = result.$1;
                final coupon = result.$2;
                ref.read(selectedCouponIndexProvider(userId).notifier).update((state) => index);
                ref.read(chosenCouponProvider(userId).notifier).update((state) => coupon);
              }
            },
            child: CouponStatusText(
              coupon: chosenCoupon,
              subtotal: feeContainer.subtotal,
            ),
          ),
          const SizedBox(width: 8.0,),
          InkWell(
            onTap: () {
              ref.invalidate(chosenCouponProvider(userId));
              ref.invalidate(selectedCouponIndexProvider(userId));
            },
            child: Icon(Icons.clear_outlined, size: 18.0, color: colorScheme.onSurfaceVariant,),
          ),
        ],
      ),
      infoText: '-\$${feeContainer.discount}',
    );
  }
}