import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:practice_food_delivery/src/features/authentication/application/auth_serviced_provider.dart';
import 'package:practice_food_delivery/src/features/coupon_box/presentation/providers/selected_coupon_index_provider.dart';

final isSelectedCouponProvider = StateProviderFamily<bool, int?>(
  (ref, inputCouponId) {
    final user = ref.watch(authServiceProvider).currentUser;
    final selectedCouponIndex = ref.watch(selectedCouponIndexProvider(user?.id));
    if (selectedCouponIndex != null) {
      return selectedCouponIndex == inputCouponId;
    }
    return false;
  },
  name: 'isSelectedCoupon',
);