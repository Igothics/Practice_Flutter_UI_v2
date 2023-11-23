part of 'random_data_generator.dart';

extension UserCouponBoxGroup on RandomData {
  static final _userCouponBoxes = List.generate(
    RandomData._maxUserCount, (index) {
      final usedCoupons = getRandomUsedCoupons(CouponGroup._coupons);
      return UserCouponBox(
        id: index,
        usedCoupons: usedCoupons,
      );
    },
  );

  List<UserCouponBox> get getUserCouponBoxes => _userCouponBoxes;
  List<Map<String, dynamic>> get getUserCouponBoxJsons => _userCouponBoxes.map((userCouponBox) => userCouponBox.toJson()).toList();
}
