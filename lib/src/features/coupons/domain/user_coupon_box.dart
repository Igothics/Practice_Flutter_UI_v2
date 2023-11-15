import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_coupon_box.freezed.dart';
part 'user_coupon_box.g.dart';

@freezed
class UserCouponBox with _$UserCouponBox {
  const factory UserCouponBox({
    required int id,
    required List<String> usedCoupons,
  }) = _UserCouponBox;

  factory UserCouponBox.fromJson(Map<String, dynamic> json) =>
      _$UserCouponBoxFromJson(json);
}