import 'package:practice_food_delivery/src/constants/enum.dart';
import 'package:practice_food_delivery/src/features/authentication/domain/user.dart';
import 'package:practice_food_delivery/src/features/coupon_box/domain/coupon.dart';
import 'package:practice_food_delivery/src/features/coupon_box/domain/user_coupon_box.dart';
import 'package:practice_food_delivery/src/features/favorites/domain/user_favorites.dart';
import 'package:practice_food_delivery/src/features/orders_history/domain/order.dart';
import 'package:practice_food_delivery/src/features/orders_history/domain/user_orders.dart';
import 'package:practice_food_delivery/src/features/payment/domain/transfer.dart';
import 'package:practice_food_delivery/src/features/payment/domain/user_balance.dart';
import 'package:practice_food_delivery/src/features/profile/domain/user_profile.dart';
import 'package:practice_food_delivery/src/features/restaurant_view/domain/food.dart';
import 'package:practice_food_delivery/src/features/restaurant_view/domain/menu.dart';
import 'package:practice_food_delivery/src/features/restaurant_view/domain/restaurant.dart';
import 'package:practice_food_delivery/src/features/settings/domain/user_settings.dart';
import 'package:practice_food_delivery/src/utils/utils.dart';
import 'package:sembast/utils/key_utils.dart';
import 'package:practice_food_delivery/generated/assets.dart';
part 'random_user.dart';
part 'random_coupon.dart';
part 'random_menu.dart';
part 'random_restaurant.dart';
part 'random_user_balance.dart';
part 'random_user_coupon_box.dart';
part 'random_user_favorites.dart';
part 'random_user_order.dart';
part 'random_user_profile.dart';
part 'random_user_settings.dart';
class RandomData{
  const RandomData._();
  static late int _maxUserCount;
  static late int _maxUserOrderCount;
  static late int _maxUserTransactionCount;
  static late int _maxCouponCount;
  static int maxUserCount() => _maxUserCount;

  factory RandomData({
    required int maxUserCount,
    required int maxUserOrderCount,
    required int maxUserTransactionCount,
    required int maxCouponCount,
  }) {
    _maxUserCount = maxUserCount;
    _maxUserOrderCount = maxUserOrderCount;
    _maxUserTransactionCount = maxUserTransactionCount;
    _maxCouponCount = maxCouponCount;
    return const RandomData._();
  }
}