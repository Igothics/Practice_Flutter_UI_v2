import 'package:practice_food_delivery/src/database/fake_database_provider.dart';
import 'package:practice_food_delivery/src/features/restaurant_view/data/restaurant_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'restaurant_repository_provider.g.dart';
@riverpod
RestaurantRepository restaurantRepository(RestaurantRepositoryRef ref) {
  final database = ref.watch(fakeDatabaseProvider).requireValue;
  return RestaurantRepository(database);
}
