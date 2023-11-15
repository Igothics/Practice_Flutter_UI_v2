import 'package:practice_food_delivery/src/database/database_repository_provider.dart';
import 'package:practice_food_delivery/src/features/authentication/application/auth_provider.dart';
import 'package:practice_food_delivery/src/features/coupons/domain/user_coupon_box.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'user_coupon_box_provider.g.dart';

@riverpod
Stream<UserCouponBox> userCouponBox(UserCouponBoxRef ref) {
  final user = ref.watch(authProvider).currentUser;
  final database = ref.watch(databaseRepositoryProvider).requireValue;
  return database.onUserCouponBoxChanged(user!.uid);
}
