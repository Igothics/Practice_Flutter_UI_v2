import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:practice_food_delivery/src/constants/enum.dart';

part 'coupon.freezed.dart';
part 'coupon.g.dart';

@freezed
sealed class Coupon with _$Coupon {
  const factory Coupon.percentage({
    required int id,
    required String code,
    required FeeType feeType,
    required bool available,
    required int maxUsageCount,
    required double value,
    required double maxDiscount,
    required double minimumSpend,
    required DateTime expirationDate,
  }) = CouponPercentage;

  const factory Coupon.fixValue({
    required int id,
    required String code,
    required FeeType feeType,
    required bool available,
    required int maxUsageCount,
    required double value,
    required double minimumSpend,
    required DateTime expirationDate,
  }) = CouponFixValue;

  const factory Coupon.freeCharge({
    required int id,
    required String code,
    required FeeType feeType,
    required bool available,
    required int maxUsageCount,
    required double minimumSpend,
    required DateTime expirationDate,
  }) = CouponFreeCharge;

  factory Coupon.fromJson(Map<String, dynamic> json) =>
      _$CouponFromJson(json);
}