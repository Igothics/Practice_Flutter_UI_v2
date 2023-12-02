import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:path_provider/path_provider.dart';
import 'package:practice_food_delivery/src/random_generator/random_data_generator.dart';
import 'package:practice_food_delivery/src/random_generator/random_data_generator_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';
import 'package:sembast_web/sembast_web.dart';

class FakeDatabase {
  FakeDatabase(this.ref);
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

  Database get db => _db;
  StoreRef get restaurantStore => _restaurantStore;
  StoreRef get menuStore => _menuStore;
  StoreRef get couponStore => _couponStore;
  StoreRef get userStore => _userStore;
  StoreRef get userSettingsStore => _userSettingsStore;
  StoreRef get userProfileStore => _userProfileStore;
  StoreRef get userOrderStore => _userOrderStore;
  StoreRef get userFavoriteStore => _userFavoriteStore;
  StoreRef get userBalanceStore => _userBalanceStore;
  StoreRef get userCouponBoxStore => _userCouponBoxStore;

  Future<void> init() async {
    log('[FakeDatabase]: Start to init...');
    if (kIsWeb) {
      const path = 'fake_web_db.db';

      await databaseFactoryWeb.deleteDatabase(path);
      log('[FakeDatabase]: Data\'s purged all!');
      _db = await databaseFactoryWeb.openDatabase(path);
    } else {
      final dir = await getApplicationDocumentsDirectory();
      final path = '${dir.path}fake_db.db';

      await databaseFactoryIo.deleteDatabase(path);
      log('[FakeDatabase]: Data\'s purged all!');
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

    final randomData = ref.read(randomDataProvider);

    final userUids = randomData.getUserUids;
    final restaurantUids = randomData.getRestaurantUids;

    final restaurantJsons = randomData.getRestaurantJsons;
    final menuJsons = randomData.getMenuJsons;

    final couponJsons = randomData.getCouponJsons;

    final userJsons = randomData.getUserJsons;
    final userSettingJsons = randomData.getUserSettingJsons;
    final userProfileJsons = randomData.getUserProfileJsons;
    final userOrderJsons = randomData.getUserOrderJsons;
    final userFavoriteJsons = randomData.getUserFavoriteJsons;
    final userBalanceJsons = randomData.getUserBalanceJsons;
    final userCouponBoxJsons = randomData.getUserCouponBoxJsons;

    log('[FakeDatabase]: Generate new data...');
    await _db.transaction((tnx) async {
        for (int i = 0; i < restaurantUids.length; i++) {
          await _restaurantStore.record(i).put(tnx, restaurantJsons[i]);
          await _menuStore.record(restaurantUids[i]).put(tnx, menuJsons[i]);
        }
        log('[FakeDatabase]: Restaurants generated!');
        log('[FakeDatabase]: Menus generated!');

        for (final couponJson in couponJsons){
          await _couponStore.add(tnx, couponJson);
        }
        log('[FakeDatabase]: Coupons generated!');

        for (int i = 0; i < userUids.length; i++) {
          await _userStore.record(i).put(tnx, userJsons[i]);// default start index of sembast intMap is 1, but user id start by 0
          await _userSettingsStore.record(userUids[i]).put(tnx, userSettingJsons[i]);
          await _userProfileStore.record(userUids[i]).put(tnx, userProfileJsons[i]);
          await _userOrderStore.record(userUids[i]).put(tnx, userOrderJsons[i]);
          await _userFavoriteStore.record(userUids[i]).put(tnx, userFavoriteJsons[i]);
          await _userBalanceStore.record(userUids[i]).put(tnx, userBalanceJsons[i]);
          await _userCouponBoxStore.record(userUids[i]).put(tnx, userCouponBoxJsons[i]);
        }
        log('[FakeDatabase]: Users generated!');
        log('[FakeDatabase]: UserSettings generated!');
        log('[FakeDatabase]: UserProfiles generated!');
        log('[FakeDatabase]: UserOrders generated!');
        log('[FakeDatabase]: UserFavorites generated!');
        log('[FakeDatabase]: UserBalances generated!');
        log('[FakeDatabase]: UserCouponBoxes generated!');
      },
    );
    log('[FakeDatabase]: Init process done!');
  }
}