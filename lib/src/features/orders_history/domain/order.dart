import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'order.freezed.dart';
part 'order.g.dart';

@freezed
class Order with _$Order {
  const factory Order({
    int? id,
    required String imageUrl,
    required String restaurantName,
    required double distance,
    required String foodName,
    DateTime? date,
    required int quantity,
    required double price,
  }) = _Order;

  factory Order.fromJson(Map<String, dynamic> json) =>
      _$OrderFromJson(json);
}
