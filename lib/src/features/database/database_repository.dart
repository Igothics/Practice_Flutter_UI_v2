import 'dart:developer';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:path_provider/path_provider.dart';
import 'package:practice_food_delivery/src/constants/constant_provider.dart';
import 'package:practice_food_delivery/src/features/cart/domain/order.dart';
import 'package:practice_food_delivery/src/features/cart/domain/user_orders.dart';
import 'package:practice_food_delivery/src/features/login/domain/user.dart';
import 'package:practice_food_delivery/src/features/menu/domain/menu.dart';
import 'package:practice_food_delivery/src/features/restaurants/domain/restaurant.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';
import 'package:sembast/utils/database_utils.dart';

class DatabaseRepository {
  DatabaseRepository(this.ref);
  final Ref ref;

  late final Database _db;
  late final StoreRef _userStore;
  late final StoreRef _restaurantStore;
  late final StoreRef _menuStore;
  late final StoreRef _userOrdersStore;

  Future<List<User>> getAllUsers() async {
    final snapshotUsers = await _userStore.find(_db);
    final users = snapshotUsers.map((snapshot) => User.fromJson(snapshot.value as Map<String, dynamic>),).toList();
    return users;
  }

  Future<List<Restaurant>> getAllRestaurant() async {
    final snapshotRestaurants = await _restaurantStore.find(_db);
    final restaurants = snapshotRestaurants.map((snapshot) => Restaurant.fromJson(snapshot.value as Map<String, dynamic>),). toList();
    return restaurants;
  }

  Future<Menu> getMenuByID(String id) async {
    final menuJson = await _menuStore.record(id).get(_db) as Map<String, dynamic>;
    return Menu.fromJson(menuJson);
  }

  Stream<UserOrders> onUserOrdersChanged(String id) {
    final userOrdersJson = _userOrdersStore.record(id).onSnapshot(_db).map((snapshot) => snapshot?.value as Map<String, dynamic>);
    final result = userOrdersJson.map((json) => UserOrders.fromJson(json));
    return result;
  }

  Future<UserOrders> getUserOrdersByID(String id) async {
    final userOrdersJson = await _userOrdersStore.record(id).get(_db) as Map<String, dynamic>;
    return UserOrders.fromJson(userOrdersJson);
  }
  Future<void> addOrders(String id, List<Order> newOrders) async {
    final currentUserOrders = await getUserOrdersByID(id);
    final currentOrdersJson = currentUserOrders.orders.map((order) => order.toJson()).toList();
    final newOrdersJson = newOrders.map((order) => order.toJson()).toList();
    final allOrders = [...currentOrdersJson, ...newOrdersJson];

    await _userOrdersStore.record(id).update(_db, {'orders': allOrders});
  }

  Future<void> init() async {
    log('[DataRepo]: Start to init...');

    final dir = await getApplicationDocumentsDirectory();
    _db = await databaseFactoryIo.openDatabase('${dir.path}fake_db.db');

    _userStore = intMapStoreFactory.store('users');
    _restaurantStore = intMapStoreFactory.store('restaurants');
    _menuStore = stringMapStoreFactory.store('menus');
    _userOrdersStore = stringMapStoreFactory.store('old_orders');

    final stores = getNonEmptyStoreNames(_db);
    if (stores.isNotEmpty){
      log('[DataRepo]: Reset data...');
      await _db.transaction((tnx) async {
          await _userStore.drop(tnx);
          await _restaurantStore.drop(tnx);
          await _menuStore.drop(tnx);
          await _userOrdersStore.drop(tnx);
        },
      );
      log('[DataRepo]: Data\'s purged all!');
    }

    final constant = ref.read(constantProvider);

    final usersJson = constant.getUsersJson;
    final restaurantsJson = constant.getRestaurantsJson;

    final oldOrdersKeys = constant.getOldOrdersKeys;
    final oldOrdersJson = constant.getUserOrdersJson;

    final menusKeys = constant.getMenusKeys;
    final menusJson = constant.getMenusJson;

    log('[DataRepo]: Generate new data...');
    await _db.transaction((tnx) async {
        await _userStore.addAll(tnx, usersJson);
        log('[DataRepo]: Users generated!');

        await _restaurantStore.addAll(tnx, restaurantsJson);
        log('[DataRepo]: Restaurants generated!');

        for (int i = 0; i < oldOrdersKeys.length; i++) {
          await _userOrdersStore.record(oldOrdersKeys[i]).put(tnx, oldOrdersJson[i]);
        }
        log('[DataRepo]: UserOrders generated!');

        for (int i = 0; i < menusKeys.length; i++) {
          await _menuStore.record(menusKeys[i]).put(tnx, menusJson[i]);
        }
        log('[DataRepo]: Menus generated!');
      },
    );
    log('[DataRepo]: Init process done!');
  }
}