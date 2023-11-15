import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:path_provider/path_provider.dart';
import 'package:practice_food_delivery/src/constants/constant_provider.dart';
import 'package:practice_food_delivery/src/features/authentication/domain/user.dart';
import 'package:practice_food_delivery/src/features/coupons/domain/coupon.dart';
import 'package:practice_food_delivery/src/features/coupons/domain/user_coupon_box.dart';
import 'package:practice_food_delivery/src/features/home/domain/restaurant.dart';
import 'package:practice_food_delivery/src/features/orders_history/domain/order.dart';
import 'package:practice_food_delivery/src/features/payment/domain/user_balance.dart';
import 'package:practice_food_delivery/src/features/orders_history/domain/user_orders.dart';
import 'package:practice_food_delivery/src/features/favorites/domain/user_favorites.dart';
import 'package:practice_food_delivery/src/features/profile/domain/user_profile.dart';
import 'package:practice_food_delivery/src/features/payment/domain/transfer.dart';
import 'package:practice_food_delivery/src/features/restaurants/domain/menu.dart';
import 'package:practice_food_delivery/src/features/settings/domain/user_settings.dart';
import 'package:practice_food_delivery/src/utils/utils.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';
import 'package:sembast_web/sembast_web.dart';

class DatabaseRepository {
  DatabaseRepository(this.ref);
  final Ref ref;
  late final Database _db;
  late final StoreRef _restaurantStore;
  late final StoreRef _menuStore;
  late final StoreRef _couponStore;
  late final StoreRef _userStore;
  late final StoreRef _userSettingsStore;
  late final StoreRef _userProfileStore;
  late final StoreRef _userOrderStore;
  late final StoreRef _userFavoriteStore;
  late final StoreRef _userBalanceStore;
  late final StoreRef _userCouponBoxStore;


  Future<Map<String, User>> getAllUsers() async {
    final userRecords = await _userStore.find(_db);
    final keys = userRecords.map((record) => record.key.toString(),);
    final values = userRecords.map((record) => User.fromJson(record.value as Map<String, dynamic>),);
    final users = Map.fromIterables(keys, values);
    return users;
  }

  Future<Map<String, Restaurant>> getAllRestaurant() async {
    final restaurantRecords = (await _restaurantStore.find(_db));
    final keys = restaurantRecords.map((record) => record.key.toString(),);
    final values = restaurantRecords.map((record) => Restaurant.fromJson(record.value as Map<String, dynamic>),);
    final restaurants = Map.fromIterables(keys, values);
    return restaurants;
  }
  Future<List<Coupon>> getAllCoupons() async {
    final finder = Finder(filter: Filter.equals('available', true));
    final couponsRecords = (await _couponStore.find(_db, finder: finder)).map((record) => record.value as Map<String, dynamic>);
    final coupons = couponsRecords.map((json) => Coupon.fromJson(json)).toList();
    return coupons;
  }
  Future<UserCouponBox> getUserCouponBoxByKey(String key) async {
    final userCouponBoxJson = (await _userCouponBoxStore.record(key).get(_db)) as Map<String, dynamic>;
    return UserCouponBox.fromJson(userCouponBoxJson);
  }
  Stream<UserCouponBox> onUserCouponBoxChanged(String key) {
    final userCouponBoxJson = _userCouponBoxStore.record(key).onSnapshot(_db).map((snapshot) => snapshot?.value as Map<String, dynamic>);
    final result = userCouponBoxJson.map((json) => UserCouponBox.fromJson(json));
    return result;
  }
  Future<void> updateUserCouponBox(String key, String couponCode) async {
    final userCouponBox = await getUserCouponBoxByKey(key);
    final updatedUsedCoupons = [...userCouponBox.usedCoupons, couponCode];
    await _userCouponBoxStore.record(key).update(_db, {'usedCoupons': updatedUsedCoupons});
  }
  Future<Menu> getMenuByKey(String key) async {
    final menuJson = (await _menuStore.record(key).get(_db)) as Map<String, dynamic>;
    return Menu.fromJson(menuJson);
  }
  Future<User> getUserByKey(int key) async {
    final userJson = (await _userStore.record(key).get(_db)) as Map<String, dynamic>;
    return User.fromJson(userJson);
  }
  Future<Restaurant> getRestaurantByKey(int key) async {
    final restaurantJson = (await _restaurantStore.record(key).get(_db)) as Map<String, dynamic>;
    return Restaurant.fromJson(restaurantJson);
  }
  Stream<UserBalance> onUserBalanceChanged(String key) {
    final userBalanceJson = _userBalanceStore.record(key).onSnapshot(_db).map((snapshot) => snapshot?.value as Map<String, dynamic>);
    final result = userBalanceJson.map((json) => UserBalance.fromJson(json));
    return result;
  }
  Future<UserProfile> getUserProfileByKey(String key) async {
    final userProfileJson = (await _userProfileStore.record(key).get(_db)) as Map<String, dynamic>;
    return UserProfile.fromJson(userProfileJson);
  }
  Future<void> updateUser(int key, User user) async {
    final userJson = user.toJson();
    await _userStore.record(key).update(_db, userJson);
  }
  Future<void> reflectToUser(int key, UserProfile userProfile) async {
    await _userStore.record(key).update(_db, {
        'displayName': userProfile.displayName,
        'email': userProfile.email,
      },
    );
  }
  Future<void> updateUserProfile(String key, UserProfile userProfile) async {
    final userProfileJson = userProfile.toJson();
    await _userProfileStore.record(key).update(_db, userProfileJson);
  }
  Future<UserSettings> getUserSettingsByKey(String key) async {
    final userSettingsJson = (await _userSettingsStore.record(key).get(_db)) as Map<String, dynamic>;
    final result = UserSettings.fromJson(userSettingsJson);
    return result;
  }
  Stream<UserSettings> onUserSettingsChanged(String key) {
    final userSettingsJson = _userSettingsStore.record(key).onSnapshot(_db).map((snapshot) => snapshot?.value as Map<String, dynamic>);
    final result = userSettingsJson.map((json) => UserSettings.fromJson(json));
    log('[Get userSettings]: result $result');
    return result;
  }
  Future<void> updateUserSettings(String key, UserSettings userSettings) async {
    final userSettingsJson = userSettings.toJson();
    final result = await _userSettingsStore.record(key).update(_db, userSettingsJson);
    log('[Update userSettings]: result ${result.toString()}');
  }
  Future<UserBalance> getUserBalanceByKey(String key) async {
    final userBalanceJson = (await _userBalanceStore.record(key).get(_db)) as Map<String, dynamic>;
    return UserBalance.fromJson(userBalanceJson);
  }
  Future<bool> updateUserBalance(String key, Transfer newTransfer) async {
    final currentUserBalance = await getUserBalanceByKey(key);
    final newBalance = currentUserBalance.balance + newTransfer.amount * newTransfer.transferType.value;
    if (newBalance < 0) {
      return Future.value(false);
    }
    final newTransferLogJsons = [
      ...currentUserBalance.transferLog,
      newTransfer.copyWith(id: currentUserBalance.transferLog.length),
    ].map((transfer) => transfer.toJson(),).toList();

    await _userBalanceStore.record(key).update(_db, {
        'balance': newBalance,
        'updateAt': newTransfer.transferDate.toIso8601String(), //Json don't support DateTime Type
        'transferLog': newTransferLogJsons,
      },
    );
    return Future.value(true);
  }

  Stream<UserOrder> onUserOrderChanged(String key) {
    final userOrdersJson = _userOrderStore.record(key).onSnapshot(_db).map((snapshot) => snapshot?.value as Map<String, dynamic>);
    final result = userOrdersJson.map((json) => UserOrder.fromJson(json));
    return result;
  }
  Future<UserOrder> getUserOrderByKey(String key) async {
    final userOrdersJson = (await _userOrderStore.record(key).get(_db)) as Map<String, dynamic>;
    return UserOrder.fromJson(userOrdersJson);
  }
  Future<void> updateUserOrder(String key, List<Order> newOrders) async {
    final currentUserOrder = await getUserOrderByKey(key);
    final newOrderJsons = [
      ...currentUserOrder.orders,
      ...reindex(newOrders, offset: currentUserOrder.orders.length),
    ].map((order) => order.toJson(),).toList();

    await _userOrderStore.record(key).update(_db, {'orders': newOrderJsons});
  }
  Stream<UserFavorites> onUserFavoritesChanged(String key) {
    final userFavoritesJson = _userFavoriteStore.record(key).onSnapshot(_db).map((snapshot) => snapshot?.value as Map<String, dynamic>);
    final result = userFavoritesJson.map((json) => UserFavorites.fromJson(json));
    return result;
  }
  Future<UserFavorites> getUserFavoritesByKey(String key) async {
    final userFavoritesJson = (await _userFavoriteStore.record(key).get(_db)) as Map<String, dynamic>;
    return UserFavorites.fromJson(userFavoritesJson);
  }
  Future<void> updateFavorites(String recordKey, int resId) async {
    final currentUserFavorites = await getUserFavoritesByKey(recordKey);
    final favorites = [...currentUserFavorites.favorites];
    if (favorites.contains(resId)) {
      favorites.remove(resId);
    } else {
      favorites.add(resId);
    }
    await _userFavoriteStore.record(recordKey).update(_db, {'favorites' : favorites});
  }

  Future<void> init() async {
    log('[DataRepo]: Start to init...');
    if (kIsWeb) {
      const path = 'fake_web_db.db';

      await databaseFactoryWeb.deleteDatabase(path);
      log('[DataRepo]: Data\'s purged all!');
      _db = await databaseFactoryWeb.openDatabase(path);
    } else {
      final dir = await getApplicationDocumentsDirectory();
      final path = '${dir.path}fake_db.db';

      await databaseFactoryIo.deleteDatabase(path);
      log('[DataRepo]: Data\'s purged all!');
      _db = await databaseFactoryIo.openDatabase(path);
    }

    _restaurantStore = intMapStoreFactory.store('restaurants'); //int Map
    _menuStore = stringMapStoreFactory.store('menus');
    _couponStore = intMapStoreFactory.store('coupons'); // int Map

    _userStore = intMapStoreFactory.store('users'); // int Map
    _userSettingsStore = stringMapStoreFactory.store('user_settings');
    _userProfileStore = stringMapStoreFactory.store('user_profiles');
    _userOrderStore = stringMapStoreFactory.store('user_orders');
    _userFavoriteStore = stringMapStoreFactory.store('user_favorites');
    _userBalanceStore = stringMapStoreFactory.store('user_balances');
    _userCouponBoxStore = stringMapStoreFactory.store('user_coupon_boxes');

    final constant = ref.read(constantProvider);

    final userUids = constant.getUserUids;
    final restaurantUids = constant.getRestaurantUids;

    final restaurantJsons = constant.getRestaurantJsons;
    final menuJsons = constant.getMenuJsons;

    final couponJsons = constant.getCouponJsons;

    final userJsons = constant.getUserJsons;

    final userSettingJsons = constant.getUserSettingJsons;
    final userProfileJsons = constant.getUserProfileJsons;
    final userOrderJsons = constant.getUserOrderJsons;
    final userFavoriteJsons = constant.getUserFavoriteJsons;
    final userBalanceJsons = constant.getUserBalanceJsons;
    final userCouponBoxJsons = constant.getUserCouponBoxJsons;

    log('[DataRepo]: Generate new data...');
    await _db.transaction((tnx) async {
        for (int i = 0; i < restaurantUids.length; i++) {
          await _restaurantStore.record(i).put(tnx, restaurantJsons[i]);
          await _menuStore.record(restaurantUids[i]).put(tnx, menuJsons[i]);
        }
        log('[DataRepo]: Restaurants generated!');
        log('[DataRepo]: Menus generated!');

        for (final couponJson in couponJsons){
          await _couponStore.add(tnx, couponJson);
        }
        log('[DataRepo]: Coupons generated!');

        for (int i = 0; i < userUids.length; i++) {
          await _userStore.record(i).put(tnx, userJsons[i]);// default start index of sembast intMap is 1, but user id start by 0
          await _userSettingsStore.record(userUids[i]).put(tnx, userSettingJsons[i]);
          await _userProfileStore.record(userUids[i]).put(tnx, userProfileJsons[i]);
          await _userOrderStore.record(userUids[i]).put(tnx, userOrderJsons[i]);
          await _userFavoriteStore.record(userUids[i]).put(tnx, userFavoriteJsons[i]);
          await _userBalanceStore.record(userUids[i]).put(tnx, userBalanceJsons[i]);
          await _userCouponBoxStore.record(userUids[i]).put(tnx, userCouponBoxJsons[i]);
        }
        log('[DataRepo]: Users generated!');
        log('[DataRepo]: UserSettings generated!');
        log('[DataRepo]: UserProfiles generated!');
        log('[DataRepo]: UserOrders generated!');
        log('[DataRepo]: UserFavorites generated!');
        log('[DataRepo]: UserBalances generated!');
        log('[DataRepo]: UserCouponBoxes generated!');
      },
    );
    log('[DataRepo]: Init process done!');
  }
}