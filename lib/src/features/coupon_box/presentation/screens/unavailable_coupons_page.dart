import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:practice_food_delivery/src/common_widgets/count_up_title.dart';
import 'package:practice_food_delivery/src/common_widgets/standard_title.dart';
import 'package:practice_food_delivery/src/features/coupon_box/presentation/providers/filtered_coupons_provider.dart';
import 'package:practice_food_delivery/src/features/coupon_box/presentation/widgets/coupon_box_builder.dart';
class UnavailableCouponsPage extends HookConsumerWidget {
  const UnavailableCouponsPage({super.key,});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final filteredCoupons = ref.watch(filteredCouponsProvider);

    return ColoredBox(
      color: colorScheme.background,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            filteredCoupons.when(
              error: (error, _) => const StandardTitle('Error!',),
              loading: () => const StandardTitle('loading...', prefix: 'Total: ',),
              data: (data) => CountUp.title(
                context,
                data.$2.length,
                prefix: 'Total: ',
                suffix: ' coupons',
              ),
            ),
            Expanded(
              child: filteredCoupons.when(
                error: (error, _) => Text('Error: $error'),
                loading: () => const Center(child: CircularProgressIndicator()),
                data: (data) {
                  final unavailable = data.$2;

                  return CouponBoxBuilder(
                    enabled: false,
                    keyGroup: 'unavailable_coupons',
                    coupons: unavailable,
                    listPadding: EdgeInsets.zero,
                    lastExtend: 8.0,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
