import 'package:practice_food_delivery/src/database/fake_database.dart';
import 'package:practice_food_delivery/src/features/coupon_box/domain/coupon.dart';
import 'package:sembast/sembast.dart';

class CouponRepository {
  const CouponRepository(this.database);
  final FakeDatabase database;
  Database get _db => database.db;
  StoreRef get _couponStore => database.couponStore;

  Future<List<Coupon>> getAllCoupons() async {
    final finder = Finder(filter: Filter.equals('available', true));
    final couponsRecords = (await _couponStore.find(_db, finder: finder)).map((record) => record.value as Map<String, dynamic>);
    final coupons = couponsRecords.map((json) => Coupon.fromJson(json)).toList();
    return coupons;
  }
}