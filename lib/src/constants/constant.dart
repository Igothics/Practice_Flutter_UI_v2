import 'package:practice_food_delivery/generated/assets.dart';
import 'package:practice_food_delivery/src/features/cart/domain/order.dart';
import 'package:practice_food_delivery/src/features/cart/domain/user_orders.dart';
import 'package:practice_food_delivery/src/features/login/domain/user.dart';
import 'package:practice_food_delivery/src/features/menu/domain/food.dart';
import 'package:practice_food_delivery/src/features/menu/domain/menu.dart';
import 'package:practice_food_delivery/src/features/restaurants/domain/restaurant.dart';
import 'package:practice_food_delivery/src/utils/utils.dart';
import 'package:sembast/utils/key_utils.dart';

class Constant {
  static const _userNum = 3;
  static const _maxOldOrders = 10;

  static const _restImages = [
    Assets.imagesRestaurant0,
    Assets.imagesRestaurant1,
    Assets.imagesRestaurant2,
    Assets.imagesRestaurant3,
    Assets.imagesRestaurant4,
  ];

  static const _foodsMap = {
    'burger': Assets.imagesBurger,
    'burrito': Assets.imagesBurrito,
    'pancakes': Assets.imagesPancakes,
    'pasta': Assets.imagesPasta,
    'pizza': Assets.imagesPizza,
    'ramen': Assets.imagesRamen,
    'salmon': Assets.imagesSalmon,
    'steak': Assets.imagesSteak,
  };

  static final _randomDates = List.generate(
    _maxOldOrders,
    (index) => DateTime.now().subtract(
      Duration(
        days: getRandomInt(365),
      ),
    ),
  )..sort();

  static final _foods = List.generate(
    _foodsMap.length,
    (index) {
      final name = _foodsMap.keys.toList()[index];
      final imageUrl = _foodsMap.values.toList()[index];

      return Food(
          id: 'food$index',
          name: name,
          imageUrl: imageUrl,
          price: getRandomPrice(),
      );
    },
  );

  static final _orders = _randomDates.map(
    (dateTime) {
      final index = getRandomIndexFromList(_restaurants);
      final restaurantName = _restaurants[index].name;
      final menu = _menus[index].foods;
      final chosenFood = menu[getRandomIndexFromList(menu)];
      final foodName = chosenFood.name;
      final quantity = getRandomQuantity();
      final price = chosenFood.price;
      final totalPrice = price * quantity;
      final date = formatDate(dateTime);

      return Order(
          restaurantName: restaurantName,
          foodName: foodName,
          date: date,
          quantity: quantity,
          price: price,
          totalPrice: totalPrice,
      );
    },
  ).toList();

  static final _users = List.generate(
    _userNum,
    (index) {
      return User(
          id: 'user0$index',
          name: getRandomUserName(),
          oldOrders: generateStringKey());
    },
  );

  static final _restaurants = List.generate(
    _restImages.length,
    (index) {
      return Restaurant(
          id: 'rest0$index',
          name: getRandomRestaurantName(),
          imageUrl: _restImages[index],
          address: getRandomRestaurantAddress(),
          rating: getRandomRating(),
          menu: generateStringKey());
    },
  );

  static final _menus = List.generate(
    _restImages.length,
    (index) {
      return Menu(
        id: 'menu$index',
        foods: getRandomList(
          _foods,
        ),
      );
    },
  );

  static final _userOrders = List.generate(
    _userNum,
    (index) {
      return UserOrders(
        id: 'order$index',
        orders: getRandomList(
          _orders,
          shuffle: false,
        ),
      );
    },
  );

  List<User> get getUsers => _users;
  List<Map<String, dynamic>> get getUsersJson => _users.map((user) => user.toJson()).toList();
  List<String> get getOldOrdersKeys => _users.map((user) => user.oldOrders).toList();

  List<Restaurant> get getRestaurants => _restaurants;
  List<Map<String, dynamic>> get getRestaurantsJson => _restaurants.map((restaurant) => restaurant.toJson()).toList();
  List<String> get getMenusKeys => _restaurants.map((restaurant) => restaurant.menu).toList();

  List<Menu> get getMenus => _menus;
  List<Map<String, dynamic>> get getMenusJson => _menus.map((menu) {
      final foodsJson = menu.foods.map((food) => food.toJson()).toList();
      final menuJson = menu.toJson();
      menuJson['foods'] = foodsJson;

      return menuJson;
    },
  ).toList();

  List<UserOrders> get getUserOrders => _userOrders;
  List<Map<String, dynamic>> get getUserOrdersJson => _userOrders.map((userOrder) {
      final ordersJson = userOrder.orders.map((order) => order.toJson()).toList();
      final userOrderJson = userOrder.toJson();
      userOrderJson['orders'] = ordersJson;

      return userOrderJson;
    },
  ).toList();

}
