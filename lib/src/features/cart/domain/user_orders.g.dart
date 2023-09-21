// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_orders.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserOrders _$$_UserOrdersFromJson(Map<String, dynamic> json) =>
    _$_UserOrders(
      id: json['id'] as String,
      orders: (json['orders'] as List<dynamic>)
          .map((e) => Order.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_UserOrdersToJson(_$_UserOrders instance) =>
    <String, dynamic>{
      'id': instance.id,
      'orders': instance.orders,
    };
