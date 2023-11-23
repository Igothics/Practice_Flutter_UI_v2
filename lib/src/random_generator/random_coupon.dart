part of 'random_data_generator.dart';

extension CouponGroup on RandomData {
  static final _coupons = List.generate(
    RandomData._maxCouponCount, (index) {
    final id = index;
    final code = getRandomCouponCode();
    final couponType = getRandomItemFromList(CouponType.values);
    final feeType = getRandomItemFromList(FeeType.values);
    final available = getRandomAvailable();
    final maxUsageCount = getRandomMaxUsageCount();
    final minimumSpend = getRandomMinimumSpend();
    final expirationDate = available ? getRandomForwardDate() : getRandomBackwardDate();

    return switch (couponType) {
      CouponType.percentage => Coupon.percentage(
        id: index,
        code: code,
        feeType: feeType,
        available: available,
        maxUsageCount: maxUsageCount,
        value: getRandomPercentage(),
        maxDiscount: getRandomMaxDiscount(),
        minimumSpend: minimumSpend,
        expirationDate: expirationDate,
      ),
      CouponType.fixValue => Coupon.fixValue(
        id: id,
        code: code,
        feeType: feeType,
        available: available,
        maxUsageCount: maxUsageCount,
        value: getRandomValue(),
        minimumSpend: minimumSpend,
        expirationDate: expirationDate,
      ),
      CouponType.freeCharge => Coupon.freeCharge(
        id: id,
        code: code,
        feeType: feeType,
        available: available,
        maxUsageCount: maxUsageCount,
        minimumSpend: minimumSpend,
        expirationDate: expirationDate,
      ),
    };
  },
  )..sort((a, b) => a.expirationDate.compareTo(b.expirationDate));

  List<Coupon> get getCoupons => reindex(_coupons);
  List<Map<String, dynamic>> get getCouponJsons => reindex(_coupons).map((coupon) => coupon.toJson()).toList();
}