import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:practice_food_delivery/src/constants/type_define.dart';
import 'package:practice_food_delivery/src/features/cart/domain/order.dart';

part 'user_orders.freezed.dart';
part 'user_orders.g.dart';

@freezed
class UserOrders with _$UserOrders {
  const factory UserOrders({
    required UserOrdersId id,
    required List<Order> orders,
  }) = _UserOrders;

  factory UserOrders.fromJson(Map<String, dynamic> json) =>
      _$UserOrdersFromJson(json);
}