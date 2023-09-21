import 'package:practice_food_delivery/src/features/database/database_repository.dart';
import 'package:practice_food_delivery/src/features/database/database_repository_provider.dart';
import 'package:practice_food_delivery/src/features/restaurants/domain/restaurant.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'restaurants_provider.g.dart';

@riverpod
Future<List<Restaurant>> restaurants(RestaurantsRef ref) async {
  final database = ref.watch(databaseRepositoryProvider);
  return database.requireValue.getAllRestaurant();
}
