// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_coupon_box.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserCouponBoxImpl _$$UserCouponBoxImplFromJson(Map<String, dynamic> json) =>
    _$UserCouponBoxImpl(
      id: json['id'] as int,
      usedCoupons: (json['usedCoupons'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$UserCouponBoxImplToJson(_$UserCouponBoxImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'usedCoupons': instance.usedCoupons,
    };
