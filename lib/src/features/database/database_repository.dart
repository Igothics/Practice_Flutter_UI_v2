import 'dart:developer';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:practice_food_delivery/src/constants/constant_provider.dart';
import 'package:practice_food_delivery/src/features/cart/domain/order.dart';
import 'package:practice_food_delivery/src/features/cart/domain/user_orders.dart';
import 'package:practice_food_delivery/src/features/login/domain/user.dart';
import 'package:practice_food_delivery/src/features/menu/domain/menu.dart';
import 'package:practice_food_delivery/src/features/restaurants/domain/restaurant.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/utils/database_utils.dart';

class DatabaseRepository {
  DatabaseRepository({required this.db, required this.ref});
  final Database db;
  final Ref ref;

  late final StoreRef _userStore;
  late final StoreRef _restaurantStore;
  late final StoreRef _menuStore;
  late final StoreRef _oldOrderStore;

  final _message = 'Fuck it';
  String get getMessage => _message;

  Future<List<User>> getAllUsers() async {
    final snapshotUsers = await _userStore.find(db);
    final users = snapshotUsers.map((snapshot) => User.fromJson(snapshot.value as Map<String, dynamic>),).toList();
    return users;
  }

  Future<List<Restaurant>> getAllRestaurant() async {
    final snapshotRestaurants = await _restaurantStore.find(db);
    final restaurants = snapshotRestaurants.map((snapshot) => Restaurant.fromJson(snapshot.value as Map<String, dynamic>),). toList();
    return restaurants;
  }

  Future<Menu> getMenuByID(String id) async {
    final menuJson = await _menuStore.record(id).get(db) as Map<String, dynamic>;
    return Menu.fromJson(menuJson);
  }

  Stream<UserOrders> userOrdersStreamByID(String id) {
    final userOrdersJson = _oldOrderStore.record(id).onSnapshot(db).map((snapshot) => snapshot?.value as Map<String, dynamic>);
    final result = userOrdersJson.map((json) => UserOrders.fromJson(json));
    return result;
  }

  Future<UserOrders> getUserOrdersByID(String id) async {
    final userOrdersJson = await _oldOrderStore.record(id).get(db) as Map<String, dynamic>;
    return UserOrders.fromJson(userOrdersJson);
  }

  Future<void> addOrders(String id, List<Order> newOrders) async {
    final currentUserOrders = await getUserOrdersByID(id);
    final currentOrdersJson = currentUserOrders.orders.map((order) => order.toJson()).toList();
    final newOrdersJson = newOrders.map((order) => order.toJson()).toList();
    final allOrders = [...currentOrdersJson, ...newOrdersJson];

    await _oldOrderStore.record(id).update(db, {'orders': allOrders});
  }

  Future<void> init() async {
    log('start to init');
    final stores = getNonEmptyStoreNames(db);
    _userStore = intMapStoreFactory.store('users');
    _restaurantStore = intMapStoreFactory.store('restaurants');
    _menuStore = stringMapStoreFactory.store('menus');
    _oldOrderStore = stringMapStoreFactory.store('old_orders');

    if (stores.isNotEmpty){
      await db.transaction((tnx) async {
          await _userStore.drop(tnx);
          await _restaurantStore.drop(tnx);
          await _menuStore.drop(tnx);
          await _oldOrderStore.drop(tnx);
        },
      );
      log('Data\'s purged all!');
    }

    final constant = ref.read(constantProvider);

    final usersJson = constant.getUsersJson;
    final restaurantsJson = constant.getRestaurantsJson;

    final oldOrdersKeys = constant.getOldOrdersKeys;
    final oldOrdersJson = constant.getUserOrdersJson;

    final menusKeys = constant.getMenusKeys;
    final menusJson = constant.getMenusJson;

    await db.transaction((tnx) async {
        await _userStore.addAll(tnx, usersJson);
        await _restaurantStore.addAll(tnx, restaurantsJson);
        for (int i = 0; i < oldOrdersKeys.length; i++) {
          await _oldOrderStore.record(oldOrdersKeys[i]).put(tnx, oldOrdersJson[i]);
        }
        for (int i = 0; i < menusKeys.length; i++) {
          await _menuStore.record(menusKeys[i]).put(tnx, menusJson[i]);
          log('record: ${menusKeys[i]} uploaded!');
        }
      },
    );
    log('Init Done!');
  }
}