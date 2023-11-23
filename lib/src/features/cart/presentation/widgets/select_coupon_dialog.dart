import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:practice_food_delivery/src/common_widgets/coupon_card.dart';
import 'package:practice_food_delivery/src/features/coupon_box/presentation/providers/filtered_coupons_provider.dart';
import 'package:practice_food_delivery/src/features/coupon_box/presentation/providers/is_selected_coupon_provider.dart';
import 'package:practice_food_delivery/src/utils/utils.dart';

class SelectCouponDialog extends HookConsumerWidget {
  const SelectCouponDialog({
    super.key,
    this.title = 'Select coupon',
    this.contentPadding = const EdgeInsets.all(16.0),
    this.insetPadding = const EdgeInsets.symmetric(horizontal: 16.0, vertical: 72),
    this.elevation = 1.0,
  });
  final String title;
  final EdgeInsets? contentPadding;
  final EdgeInsets? insetPadding;
  final double? elevation;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final filteredCoupons = ref.watch(filteredCouponsProvider);

    return filteredCoupons.when(
      error: (error, _) => Center(child: Text('Error: $error')),
      loading: () => const Center(child: CircularProgressIndicator()),
      data: (data) {
        final available = data.$1;

        return SimpleDialog(
          elevation: elevation,
          contentPadding: contentPadding ?? EdgeInsets.zero,
          insetPadding: insetPadding ?? EdgeInsets.zero,
          title: Text(title),
          children: List.generate(available.length, (index) {
              final coupon = available.keys.elementAt(index);
              final count = available.values.elementAt(index);
              final title = buildCouponTitles(coupon);
              final subtitle = 'EXP: ${formatRecordDate(coupon.expirationDate)}';
              final icon = coupon.feeType.icon;
              final trailing = '$count / ${coupon.maxUsageCount}';
              final isSelected = ref.watch(isSelectedCouponProvider(index));

              return SimpleDialogOption(
                onPressed: () => context.pop((index, coupon)),
                padding: EdgeInsets.zero,
                child: CouponCard(
                  selected: isSelected,
                  margin: const EdgeInsets.symmetric(vertical: 4.0),
                  infoPadding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
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
            },
          ),
        );
      },
    );
  }
}
