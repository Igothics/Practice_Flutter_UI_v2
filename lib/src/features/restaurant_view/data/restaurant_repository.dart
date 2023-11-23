import 'package:practice_food_delivery/src/database/fake_database.dart';
import 'package:practice_food_delivery/src/features/restaurant_view/domain/restaurant.dart';
import 'package:practice_food_delivery/src/features/restaurant_view/domain/menu.dart';
import 'package:sembast/sembast.dart';

class RestaurantRepository {
  const RestaurantRepository(this.database);
  final FakeDatabase database;
  Database get _db => database.db;
  StoreRef get _restaurantStore => database.restaurantStore;
  StoreRef get _menuStore => database.menuStore;

  Future<List<Restaurant>> getAllRestaurant() async {
    final restaurantJsons = (await _restaurantStore.find(_db)).map((record) => record.value as Map<String, dynamic>);
    final restaurants = restaurantJsons.map((json) => Restaurant.fromJson(json),).toList();
    return restaurants;
  }
  Future<Menu> getMenuByKey(String key) async {
    final menuJson = (await _menuStore.record(key).get(_db)) as Map<String, dynamic>;
    return Menu.fromJson(menuJson);
  }
}