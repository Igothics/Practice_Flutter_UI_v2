part of 'random_data_generator.dart';

extension UserFavoritesGroup on RandomData {
  static final _userFavorites = List.generate(
    RandomData._maxUserCount, (index) {
      return UserFavorites(
        id: index,
        favorites: getRandomList(RestaurantGroup._restaurantIds),
      );
    },
  );

  List<UserFavorites> get getUserFavorites => _userFavorites;
  List<Map<String, dynamic>> get getUserFavoriteJsons => _userFavorites.map((userFavorite) => userFavorite.toJson()).toList();
}