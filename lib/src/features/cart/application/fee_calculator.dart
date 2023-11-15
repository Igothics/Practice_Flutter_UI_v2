import 'dart:math';

import 'package:practice_food_delivery/src/features/coupons/domain/coupon.dart';
import 'package:practice_food_delivery/src/features/orders_history/domain/order.dart';
import 'package:practice_food_delivery/src/utils/utils.dart';

class FeeCalculator {
  const FeeCalculator();
  static const freeDistance = 0.5; //km
  static const baseFee = 0.21; // usd
  static const peakHourFactor = 1.5; // ratio
  static const taxVAT = 0.1;
  static double _deliveryFeeFrom(double distance, DateTime dateTime) {
    final orderHour = dateTime.hour;
    if (distance <= freeDistance) {
      return 0.0;
    }
    double fee = baseFee * distance;
    if ((orderHour >= 11 && orderHour <= 14) || (orderHour >= 17 && orderHour <= 21)) {
      fee *= peakHourFactor ?? 1;
    }
    return fixDouble(fee);
  }

  //External
  double calculateSubtotal(List<Order> orders) => orders.fold(0.0, (initial, order) => initial + (order.price * order.quantity));
  double calculateTax(double subtotal) => fixDouble(subtotal * taxVAT);
  double calculateTotalDeliveryFee(List<Order> orders) {
    final dateTime = DateTime.now();
    final result = orders.map((order) => _deliveryFeeFrom(
      order.distance,
      dateTime,
    ),).fold(0.0, (initial, fee) => initial + fee,);
    return result;
  }
  double calculateDiscount(double value, Coupon coupon) {
    return switch(coupon){
      CouponPercentage coupon => min(coupon.value * value, coupon.maxDiscount),
      CouponFixValue coupon => coupon.value,
      CouponFreeCharge coupon => value,
    };
  }
}