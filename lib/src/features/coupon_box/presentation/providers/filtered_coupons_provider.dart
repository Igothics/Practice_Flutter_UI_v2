import 'package:practice_food_delivery/src/features/coupon_box/domain/coupon.dart';
import 'package:practice_food_delivery/src/features/coupon_box/presentation/providers/coupons_provider.dart';
import 'package:practice_food_delivery/src/features/coupon_box/presentation/providers/user_coupon_box_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'filtered_coupons_provider.g.dart';
@riverpod
AsyncValue<(Map<Coupon, int>, Map<Coupon, int>)> filteredCoupons(FilteredCouponsRef ref) {
  final coupons = ref.watch(couponsProvider);
  final userCouponBox = ref.watch(userCouponBoxProvider);

  return coupons.when(
    error: (error, stackTrace) => AsyncError(error, stackTrace),
    loading: () => const AsyncLoading(),
    data: (coupons) => userCouponBox.when(
      error: (error, stackTrace) => AsyncError(error, stackTrace),
      loading: () => const AsyncLoading(),
      data: (userCouponBox) {
        final available = <Coupon, int>{};
        final unavailable = <Coupon, int>{};
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

        return AsyncData((available, unavailable));
      },
    ),
  );
}
