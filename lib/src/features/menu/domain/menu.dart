import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:practice_food_delivery/src/constants/type_define.dart';
import 'package:practice_food_delivery/src/features/menu/domain/food.dart';

part 'menu.freezed.dart';
part 'menu.g.dart';

@freezed
class Menu with _$Menu {
  const factory Menu({
    required MenuId id,
    required List<Food> foods,
  }) = _Menu;

  factory Menu.fromJson(Map<String, dynamic> json) =>
      _$MenuFromJson(json);
}