import 'package:practice_food_delivery/src/features/restaurant_view/data/restaurant_repository_provider.dart';
import 'package:practice_food_delivery/src/features/restaurant_view/domain/menu.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'menu_provider.g.dart';

@riverpod
Future<Menu> menu(MenuRef ref, String key) {
  final restaurantRepository = ref.watch(restaurantRepositoryProvider);
  return restaurantRepository.getMenuByKey(key);
}
