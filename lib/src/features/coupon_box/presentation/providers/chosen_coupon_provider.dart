import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:practice_food_delivery/src/features/coupon_box/domain/coupon.dart';

final chosenCouponProvider = StateProviderFamily<Coupon?, int?>((ref, userId) => null, name: 'chosenCoupon',);