// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fee_container.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FeeContainerImpl _$$FeeContainerImplFromJson(Map<String, dynamic> json) =>
    _$FeeContainerImpl(
      subtotal: (json['subtotal'] as num?)?.toDouble() ?? 0.0,
      deliveryFee: (json['deliveryFee'] as num?)?.toDouble() ?? 0.0,
      tax: (json['tax'] as num?)?.toDouble() ?? 0.0,
      discount: (json['discount'] as num?)?.toDouble() ?? 0.0,
      total: (json['total'] as num?)?.toDouble() ?? 0.0,
    );

Map<String, dynamic> _$$FeeContainerImplToJson(_$FeeContainerImpl instance) =>
    <String, dynamic>{
      'subtotal': instance.subtotal,
      'deliveryFee': instance.deliveryFee,
      'tax': instance.tax,
      'discount': instance.discount,
      'total': instance.total,
    };
