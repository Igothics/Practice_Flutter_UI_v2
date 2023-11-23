import 'package:practice_food_delivery/src/features/favorites/presentation/providers/user_favorites_provider.dart';
import 'package:practice_food_delivery/src/features/restaurant_view/domain/restaurant.dart';
import 'package:practice_food_delivery/src/features/home_view/presentation/providers/restaurants_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'favorited_restaurants_provider.g.dart';
@riverpod
AsyncValue<List<Restaurant>> favoritedRestaurants(FavoritedRestaurantsRef ref) {
  final restaurants = ref.watch(restaurantsProvider);
  final favorites = ref.watch(userFavoritesProvider);

  return favorites.when(
    error: (error,stackTrace) => AsyncError(error, stackTrace),
    loading: () => const AsyncLoading(),
    data: (userFavorites) => restaurants.when(
      error: (error, stackTrace) => AsyncError(error, stackTrace),
      loading: () => const AsyncLoading(),
      data: (restaurants) {
        final favorites = userFavorites.favorites;
        final favoritedRestaurants = restaurants.where((restaurant) => favorites.contains(restaurant.id)).toList();
        return AsyncData(favoritedRestaurants);
      },
    ),
  );
}
