// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coupon.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CouponPercentageImpl _$$CouponPercentageImplFromJson(
        Map<String, dynamic> json) =>
    _$CouponPercentageImpl(
      id: json['id'] as int,
      code: json['code'] as String,
      feeType: $enumDecode(_$FeeTypeEnumMap, json['feeType']),
      available: json['available'] as bool,
      maxUsageCount: json['maxUsageCount'] as int,
      value: (json['value'] as num).toDouble(),
      maxDiscount: (json['maxDiscount'] as num).toDouble(),
      minimumSpend: (json['minimumSpend'] as num).toDouble(),
      expirationDate: DateTime.parse(json['expirationDate'] as String),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$CouponPercentageImplToJson(
        _$CouponPercentageImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'feeType': _$FeeTypeEnumMap[instance.feeType]!,
      'available': instance.available,
      'maxUsageCount': instance.maxUsageCount,
      'value': instance.value,
      'maxDiscount': instance.maxDiscount,
      'minimumSpend': instance.minimumSpend,
      'expirationDate': instance.expirationDate.toIso8601String(),
      'runtimeType': instance.$type,
    };

const _$FeeTypeEnumMap = {
  FeeType.orderPrice: 'orderPrice',
  FeeType.shippingFee: 'shippingFee',
  FeeType.taxFee: 'taxFee',
};

_$CouponFixValueImpl _$$CouponFixValueImplFromJson(Map<String, dynamic> json) =>
    _$CouponFixValueImpl(
      id: json['id'] as int,
      code: json['code'] as String,
      feeType: $enumDecode(_$FeeTypeEnumMap, json['feeType']),
      available: json['available'] as bool,
      maxUsageCount: json['maxUsageCount'] as int,
      value: (json['value'] as num).toDouble(),
      minimumSpend: (json['minimumSpend'] as num).toDouble(),
      expirationDate: DateTime.parse(json['expirationDate'] as String),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$CouponFixValueImplToJson(
        _$CouponFixValueImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'feeType': _$FeeTypeEnumMap[instance.feeType]!,
      'available': instance.available,
      'maxUsageCount': instance.maxUsageCount,
      'value': instance.value,
      'minimumSpend': instance.minimumSpend,
      'expirationDate': instance.expirationDate.toIso8601String(),
      'runtimeType': instance.$type,
    };

_$CouponFreeChargeImpl _$$CouponFreeChargeImplFromJson(
        Map<String, dynamic> json) =>
    _$CouponFreeChargeImpl(
      id: json['id'] as int,
      code: json['code'] as String,
      feeType: $enumDecode(_$FeeTypeEnumMap, json['feeType']),
      available: json['available'] as bool,
      maxUsageCount: json['maxUsageCount'] as int,
      minimumSpend: (json['minimumSpend'] as num).toDouble(),
      expirationDate: DateTime.parse(json['expirationDate'] as String),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$CouponFreeChargeImplToJson(
        _$CouponFreeChargeImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'feeType': _$FeeTypeEnumMap[instance.feeType]!,
      'available': instance.available,
      'maxUsageCount': instance.maxUsageCount,
      'minimumSpend': instance.minimumSpend,
      'expirationDate': instance.expirationDate.toIso8601String(),
      'runtimeType': instance.$type,
    };
