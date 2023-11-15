import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:practice_food_delivery/src/features/coupons/domain/coupon.dart';

final chosenCouponProvider = StateProvider.family<Coupon?, int?>((ref, id) => null);