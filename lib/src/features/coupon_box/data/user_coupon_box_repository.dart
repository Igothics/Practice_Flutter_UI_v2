import 'package:practice_food_delivery/src/database/fake_database.dart';
import 'package:practice_food_delivery/src/features/coupon_box/domain/user_coupon_box.dart';
import 'package:sembast/sembast.dart';

class UserCouponBoxRepository {
  const UserCouponBoxRepository(this._key, this.database);
  final String _key;
  final FakeDatabase database;
  Database get _db => database.db;
  StoreRef get _userCouponBoxStore => database.userCouponBoxStore;

  Future<UserCouponBox> getUserCouponBox() async {
    final userCouponBoxJson = (await _userCouponBoxStore.record(_key).get(_db)) as Map<String, dynamic>;
    return UserCouponBox.fromJson(userCouponBoxJson);
  }
  Stream<UserCouponBox> onUserCouponBoxChanged() {
    final userCouponBoxJson = _userCouponBoxStore.record(_key).onSnapshot(_db).map((snapshot) => snapshot?.value as Map<String, dynamic>);
    final result = userCouponBoxJson.map((json) => UserCouponBox.fromJson(json));
    return result;
  }
  Future<void> updateUserCouponBox(String couponCode) async {
    final userCouponBox = await getUserCouponBox();
    final updatedUsedCoupons = [...userCouponBox.usedCoupons, couponCode];
    await _userCouponBoxStore.record(_key).update(_db, {'usedCoupons': updatedUsedCoupons});
  }
}