// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FoodImpl _$$FoodImplFromJson(Map<String, dynamic> json) => _$FoodImpl(
      id: json['id'] as int,
      name: json['name'] as String,
      imageUrl: json['imageUrl'] as String,
      price: (json['price'] as num).toDouble(),
    );

Map<String, dynamic> _$$FoodImplToJson(_$FoodImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'imageUrl': instance.imageUrl,
      'price': instance.price,
    };
