import 'package:practice_food_delivery/src/features/restaurant_view/domain/restaurant.dart';
import 'package:practice_food_delivery/src/features/restaurant_view/data/restaurant_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'restaurants_provider.g.dart';

@riverpod
Future<List<Restaurant>> restaurants(RestaurantsRef ref) {
  final restaurantRepository = ref.watch(restaurantRepositoryProvider);
  return restaurantRepository.getAllRestaurant();
}
