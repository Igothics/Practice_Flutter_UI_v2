import 'package:practice_food_delivery/src/features/coupon_box/data/coupon_repository_provider.dart';
import 'package:practice_food_delivery/src/features/coupon_box/domain/coupon.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'coupons_provider.g.dart';

@riverpod
Future<List<Coupon>> coupons(CouponsRef ref) async {
  final couponRepository = ref.watch(couponRepositoryProvider);
  return couponRepository.getAllCoupons();
}
