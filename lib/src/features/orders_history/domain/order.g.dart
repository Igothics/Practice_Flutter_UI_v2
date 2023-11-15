// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrderImpl _$$OrderImplFromJson(Map<String, dynamic> json) => _$OrderImpl(
      id: json['id'] as int?,
      imageUrl: json['imageUrl'] as String,
      restaurantName: json['restaurantName'] as String,
      distance: (json['distance'] as num).toDouble(),
      foodName: json['foodName'] as String,
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
      quantity: json['quantity'] as int,
      price: (json['price'] as num).toDouble(),
    );

Map<String, dynamic> _$$OrderImplToJson(_$OrderImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'imageUrl': instance.imageUrl,
      'restaurantName': instance.restaurantName,
      'distance': instance.distance,
      'foodName': instance.foodName,
      'date': instance.date?.toIso8601String(),
      'quantity': instance.quantity,
      'price': instance.price,
    };
