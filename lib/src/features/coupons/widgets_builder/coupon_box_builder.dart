import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:practice_food_delivery/src/common_widgets/stored_list_view.dart';
import 'package:practice_food_delivery/src/features/authentication/application/auth_provider.dart';
import 'package:practice_food_delivery/src/features/coupons/domain/coupon.dart';
import 'package:practice_food_delivery/src/common_widgets/coupon_card.dart';
import 'package:practice_food_delivery/src/features/coupons/presentation/chosen_coupon_provider.dart';
import 'package:practice_food_delivery/src/features/coupons/presentation/selected_coupon_index_provider.dart';
import 'package:practice_food_delivery/src/utils/utils.dart';

class CouponBoxBuilder extends HookConsumerWidget {
  const CouponBoxBuilder({
    super.key,
    required this.keyGroup,
    required this.coupons,
    this.margin = const EdgeInsets.symmetric(vertical: 4.0),
    this.listPadding = const EdgeInsets.symmetric(horizontal: 16.0),
    this.lastExtend,
    this.enabled = true,
  });
  final String keyGroup;
  final Map<Coupon, int> coupons;
  final EdgeInsets? margin;
  final EdgeInsets? listPadding;
  final double? lastExtend;
  final bool enabled;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final userId = ref.watch(authProvider).currentUser?.id;
    final selected = ref.watch(selectedCouponIndexProvider(userId));

    return StoredListView(
      storeKey: keyGroup,
      itemCount: coupons.length + 1,
      listPadding: listPadding,
      itemBuilder: (_, index){
        if (index == coupons.length) {
          return SizedBox(height: lastExtend ?? 0.0,);
        }
        final coupon = coupons.keys.elementAt(index);
        final count = coupons.values.elementAt(index);
        final title = _buildTitles(coupon);
        final subtitle = 'EXP: ${formatRecordDate(coupon.expirationDate)}';
        final icon = coupon.feeType.icon;
        final trailing = '$count / ${coupon.maxUsageCount}';

        return CouponCard(
          selected: selected == index,
          enabled: enabled,
          margin: margin,
          infoPadding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
          cardId: '$keyGroup-$index',
          icon: Icon(icon, color: colorScheme.onPrimaryContainer,),
          titles: [Text(title,)],
          subtitles: [Text(subtitle,)],
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Used',),
              Text(trailing,),
            ],
          ),
          onPressed: () {
            ref.read(chosenCouponProvider(userId).notifier).update((state) => state?.code != coupon.code ? coupon : null);
            ref.read(selectedCouponIndexProvider(userId).notifier).update((state) => state != index ? index : null);
          },
        );
      },
    );
  }
}
String _buildTitles(Coupon coupon) => switch(coupon){
  CouponPercentage data => 'Discount ${data.value * 100}% on ${data.feeType.value} up to \$${data.maxDiscount}\nWhen orders reach \$${data.minimumSpend}',
  CouponFixValue data => 'Discount \$${data.value} on ${data.feeType.value}\nWhen orders reach \$${data.minimumSpend}',
  CouponFreeCharge data => 'Free charge on ${data.feeType.value}\nWhen orders reach \$${data.minimumSpend}',
};
