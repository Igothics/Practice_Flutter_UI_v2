import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'restaurant.freezed.dart';
part 'restaurant.g.dart';

@freezed
class Restaurant with _$Restaurant {
  const factory Restaurant({
    required int id,
    required String uid,
    required String name,
    required String imageUrl,
    required String address,
    required double distance,
    required double rating,
  }) = _Restaurant;

  factory Restaurant.fromJson(Map<String, dynamic> json) =>
      _$RestaurantFromJson(json);
}