// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_orders.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserOrderImpl _$$UserOrderImplFromJson(Map<String, dynamic> json) =>
    _$UserOrderImpl(
      id: json['id'] as int,
      orders: (json['orders'] as List<dynamic>)
          .map((e) => Order.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$UserOrderImplToJson(_$UserOrderImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'orders': instance.orders.map((e) => e.toJson()).toList(),
    };
