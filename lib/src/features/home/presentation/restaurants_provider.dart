import 'package:practice_food_delivery/src/database/database_repository_provider.dart';
import 'package:practice_food_delivery/src/features/home/domain/restaurant.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'restaurants_provider.g.dart';

@Riverpod(keepAlive: true)
Future<Map<String, Restaurant>> restaurants(RestaurantsRef ref) async {
  final database = ref.watch(databaseRepositoryProvider);
  return database.requireValue.getAllRestaurant();
}
