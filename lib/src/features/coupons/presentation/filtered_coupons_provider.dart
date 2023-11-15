import 'dart:developer';

import 'package:practice_food_delivery/src/features/coupons/domain/coupon.dart';
import 'package:practice_food_delivery/src/features/coupons/presentation/coupons_provider.dart';
import 'package:practice_food_delivery/src/features/coupons/presentation/user_coupon_box_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'filtered_coupons_provider.g.dart';
@riverpod
(Map<Coupon, int>, Map<Coupon, int>) filteredCoupons(FilteredCouponsRef ref) {
  final coupons = ref.watch(couponsProvider);
  final userCouponBox = ref.watch(userCouponBoxProvider);
  final available = <Coupon, int>{};
  final unavailable = <Coupon, int>{};
  coupons.when(
    error: (error, _) => log('[Coupon Provider]: error!'),
    loading: () => log('[Coupon Provider]: loading..'),
    data: (coupons) => userCouponBox.when(
      error: (error, _) => log('[UserCouponBox Provider]: error!'),
      loading: () => log('[UserCouponBox Provider]: loading..'),
      data: (userCouponBox) {
        final usedCoupons = userCouponBox.usedCoupons;

        for(final coupon in coupons){
          final usedCount = (usedCoupons.where((e) => e == coupon.code)).length;
          final remained = coupon.maxUsageCount - usedCount;

          if (remained > 0) {
            available.putIfAbsent(coupon, () => usedCount);
          } else {
            unavailable.putIfAbsent(coupon, () => usedCount);
          }
        }
      },
    ),
  );
  return (available, unavailable);
}
