import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:practice_food_delivery/src/features/orders_history/domain/order.dart';

part 'item.freezed.dart';
part 'item.g.dart';

@freezed
class Item with _$Item {
  const factory Item({
    int? id,
    @Default(true) bool activated,
    required Order order,
  }) = _Item;

  factory Item.fromJson(Map<String, dynamic> json) =>
      _$ItemFromJson(json);
}