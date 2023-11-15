import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:practice_food_delivery/src/features/orders_history/domain/order.dart';

part 'user_orders.freezed.dart';
part 'user_orders.g.dart';

@freezed
class UserOrder with _$UserOrder {
  @JsonSerializable(explicitToJson: true)
  const factory UserOrder({
    required int id,
    required List<Order> orders,
  }) = _UserOrder;

  factory UserOrder.fromJson(Map<String, dynamic> json) =>
      _$UserOrderFromJson(json);
}