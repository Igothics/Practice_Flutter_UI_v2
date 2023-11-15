import 'package:practice_food_delivery/src/features/authentication/application/auth_provider.dart';
import 'package:practice_food_delivery/src/features/favorites/presentation/user_favorites_provider.dart';
import 'package:practice_food_delivery/src/features/home/domain/restaurant.dart';
import 'package:practice_food_delivery/src/features/home/presentation/restaurants_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'favorited_restaurants_provider.g.dart';
@riverpod
Map<String, Restaurant> favoritedRestaurants(FavoritedRestaurantsRef ref) {
  final user = ref.watch(authProvider).currentUser!;
  final restaurants = ref.watch(restaurantsProvider).valueOrNull ?? {};
  final userFavorites = ref.watch(userFavoritesProvider(user.uid)).valueOrNull?.favorites ?? [];
  final result = <String, Restaurant>{};
  for(final entry in restaurants.entries){
    if (userFavorites.contains(entry.value.id)){
      result.putIfAbsent(entry.key, () => entry.value);
    }
  }
  return result;
}
