import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'food.freezed.dart';
part 'food.g.dart';

@freezed
class Food with _$Food {
  const factory Food({
    required int id,
    required String name,
    required String imageUrl,
    required double price,
  }) = _Food;

  factory Food.fromJson(Map<String, dynamic> json) =>
      _$FoodFromJson(json);
}