part of 'random_data_generator.dart';

extension RestaurantGroup on RandomData {
  static final _restaurantImageUrls = [
    Assets.imagesRestaurant0,
    Assets.imagesRestaurant1,
    Assets.imagesRestaurant2,
    Assets.imagesRestaurant3,
    Assets.imagesRestaurant4,
  ];
  static final _restaurantCount = _restaurantImageUrls.length;
  static final _restaurants = List.generate(
    _restaurantCount, (index) {
      return Restaurant(
        id: index,
        uid: generateStringKey(),
        name: getRandomRestaurantName(),
        imageUrl: _restaurantImageUrls[index],
        address: getRandomAddress(),
        distance: getRandomDistance(),
        rating: getRandomRating(),
      );
    },
  );
  static final _restaurantIds = _restaurants.map((restaurant) => restaurant.id).toList();

  List<String> get getRestaurantUids => _restaurants.map((restaurant) => restaurant.uid).toList();
  List<Restaurant> get getRestaurants => _restaurants;
  List<Map<String, dynamic>> get getRestaurantJsons => _restaurants.map((restaurant) => restaurant.toJson()).toList();
}