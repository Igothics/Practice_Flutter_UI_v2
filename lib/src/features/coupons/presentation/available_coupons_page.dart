import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:practice_food_delivery/src/common_widgets/standard_title.dart';
import 'package:practice_food_delivery/src/features/coupons/presentation/chosen_coupon_provider.dart';
import 'package:practice_food_delivery/src/features/coupons/presentation/filtered_coupons_provider.dart';
import 'package:practice_food_delivery/src/features/coupons/widgets_builder/coupon_box_builder.dart';

class AvailableCouponsPage extends HookConsumerWidget {
  const AvailableCouponsPage({super.key,});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final (available, _) = ref.watch(filteredCouponsProvider);

    return ColoredBox(
      color: colorScheme.background,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            StandardTitle(
              available.length.toString(),
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              prefix: 'Total: ',
              suffix: ' coupons',
            ),
            Expanded(
              child: CouponBoxBuilder(
                keyGroup: 'available_coupons',
                coupons: available,
                listPadding: EdgeInsets.zero,
                lastExtend: 8.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
