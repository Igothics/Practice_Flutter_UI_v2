import 'package:practice_food_delivery/src/features/favorites/data/user_favorites_repository_provider.dart';
import 'package:practice_food_delivery/src/features/favorites/domain/user_favorites.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'user_favorites_provider.g.dart';
@riverpod
Stream<UserFavorites> userFavorites(UserFavoritesRef ref) {
  final userFavoritesRepository = ref.watch(userFavoritesRepositoryProvider);
  return userFavoritesRepository.onUserFavoritesChanged();
}
