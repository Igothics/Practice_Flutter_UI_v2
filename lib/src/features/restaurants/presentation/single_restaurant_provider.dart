import 'package:practice_food_delivery/src/features/home/domain/restaurant.dart';
import 'package:practice_food_delivery/src/features/home/presentation/restaurants_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'single_restaurant_provider.g.dart';
@Riverpod(keepAlive: true)
Restaurant singleRestaurant(SingleRestaurantRef ref, String id) {
  final restaurants = ref.watch(restaurantsProvider);
  final result = restaurants.requireValue[id];
  return result!;
}
