import 'package:practice_food_delivery/src/database/fake_database_provider.dart';
import 'package:practice_food_delivery/src/features/coupon_box/data/coupon_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'coupon_repository_provider.g.dart';
@riverpod
CouponRepository couponRepository(CouponRepositoryRef ref) {
  final database = ref.watch(fakeDatabaseProvider).requireValue;
  return CouponRepository(database);
}