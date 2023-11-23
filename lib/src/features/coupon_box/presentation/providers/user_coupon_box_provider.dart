import 'package:practice_food_delivery/src/features/coupon_box/data/user_coupon_box_repository_provider.dart';
import 'package:practice_food_delivery/src/features/coupon_box/domain/user_coupon_box.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'user_coupon_box_provider.g.dart';

@riverpod
Stream<UserCouponBox> userCouponBox(UserCouponBoxRef ref) {
  final userCouponBoxRepository = ref.watch(userCouponBoxRepositoryProvider);
  return userCouponBoxRepository.onUserCouponBoxChanged();
}
