import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:practice_food_delivery/src/constants/type_define.dart';

part 'food.freezed.dart';
part 'food.g.dart';

@freezed
class Food with _$Food {
  const factory Food({
    required FoodId id,
    required String name,
    required String imageUrl,
    required double price,
  }) = _Food;

  factory Food.fromJson(Map<String, dynamic> json) =>
      _$FoodFromJson(json);
}