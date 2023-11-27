import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:practice_food_delivery/src/common_widgets/custom_animation.dart';
import 'package:practice_food_delivery/src/common_widgets/stored_list_view.dart';
import 'package:practice_food_delivery/src/features/authentication/application/auth_serviced_provider.dart';
import 'package:practice_food_delivery/src/features/coupon_box/domain/coupon.dart';
import 'package:practice_food_delivery/src/features/coupon_box/presentation/providers/chosen_coupon_provider.dart';
import 'package:practice_food_delivery/src/common_widgets/coupon_card.dart';
import 'package:practice_food_delivery/src/features/coupon_box/presentation/providers/is_selected_coupon_provider.dart';
import 'package:practice_food_delivery/src/features/coupon_box/presentation/providers/selected_coupon_index_provider.dart';
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
    final userId = ref.watch(authServiceProvider).currentUser?.id;

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
        final title = buildCouponTitles(coupon);
        final subtitle = 'EXP: ${formatRecordDate(coupon.expirationDate)}';
        final icon = coupon.feeType.icon;
        final trailing = '$count / ${coupon.maxUsageCount}';
        final isSelected = ref.watch(isSelectedCouponProvider(index));

        return CustomAnimation.fadeSlide(
          delay: 100.ms * index,
          child: CouponCard(
            selected: enabled && isSelected,
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
              ref.read(chosenCouponProvider(userId).notifier)
                  .update((state) => state?.code != coupon.code ? coupon : null);
              ref.read(selectedCouponIndexProvider(userId).notifier)
                  .update((state) => state != index ? index : null);
            },
          ),
        );
      },
    );
  }
}