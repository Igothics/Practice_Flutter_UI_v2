part of 'random_data_generator.dart';

extension UserOrderGroup on RandomData {
  static final _orders = List.generate(
      RandomData._maxUserOrderCount, (index) {
      final index = getRandomIndexFromList(RestaurantGroup._restaurants);
      final chosenRestaurant = RestaurantGroup._restaurants[index];
      final restaurantName = chosenRestaurant.name;
      final distance = chosenRestaurant.distance;
      final foods = MenuGroup._menus[index].foods;
      final chosenFood = getRandomItemFromList(foods);
      final imageUrl = chosenFood.imageUrl;
      final foodName = chosenFood.name;
      final quantity = getRandomQuantity();
      final price = chosenFood.price;
      final dateTime = getRandomBackwardDate();

      return Order(
        id: 0, //initial 0, then adjust later
        imageUrl: imageUrl,
        restaurantName: restaurantName,
        distance: distance,
        foodName: foodName,
        date: dateTime,
        quantity: quantity,
        price: price,
      );
    },
  );
  static final _userOrders = List.generate(
    RandomData._maxUserCount, (index) {
      final orders = getRandomList(_orders, shuffle: false,)..sort((a,b) => a.date!.compareTo(b.date!));

      return UserOrder(
        id: index,
        orders: reindex(orders),
      );
    },
  );

  List<UserOrder> get getUserOrders => _userOrders;
  List<Map<String, dynamic>> get getUserOrderJsons => _userOrders.map((userOrder) => userOrder.toJson()).toList();
}