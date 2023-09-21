// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Order _$$_OrderFromJson(Map<String, dynamic> json) => _$_Order(
      restaurantName: json['restaurantName'] as String,
      foodName: json['foodName'] as String,
      date: json['date'] as String,
      quantity: json['quantity'] as int,
      price: (json['price'] as num).toDouble(),
      totalPrice: (json['totalPrice'] as num).toDouble(),
    );

Map<String, dynamic> _$$_OrderToJson(_$_Order instance) => <String, dynamic>{
      'restaurantName': instance.restaurantName,
      'foodName': instance.foodName,
      'date': instance.date,
      'quantity': instance.quantity,
      'price': instance.price,
      'totalPrice': instance.totalPrice,
    };
