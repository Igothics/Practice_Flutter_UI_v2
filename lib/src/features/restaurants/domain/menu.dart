import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:practice_food_delivery/src/features/restaurants/domain/food.dart';

part 'menu.freezed.dart';
part 'menu.g.dart';

@freezed
class Menu with _$Menu {
  @JsonSerializable(explicitToJson: true)
  const factory Menu({
    required int id,
    required List<Food> foods,
  }) = _Menu;

  factory Menu.fromJson(Map<String, dynamic> json) =>
      _$MenuFromJson(json);
}