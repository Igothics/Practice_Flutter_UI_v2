import 'package:practice_food_delivery/src/database/fake_database.dart';
import 'package:practice_food_delivery/src/features/favorites/domain/user_favorites.dart';
import 'package:sembast/sembast.dart';

class UserFavoritesRepository {
  const UserFavoritesRepository(this._key, this.database);
  final String _key;
  final FakeDatabase database;
  Database get _db => database.db;
  StoreRef get _userFavoriteStore => database.userFavoriteStore;

  Stream<UserFavorites> onUserFavoritesChanged() {
    final userFavoritesJson = _userFavoriteStore.record(_key).onSnapshot(_db).map((snapshot) => snapshot?.value as Map<String, dynamic>);
    final result = userFavoritesJson.map((json) => UserFavorites.fromJson(json));
    return result;
  }
  Future<UserFavorites> getUserFavorites() async {
    final userFavoritesJson = (await _userFavoriteStore.record(_key).get(_db)) as Map<String, dynamic>;
    return UserFavorites.fromJson(userFavoritesJson);
  }
  Future<void> updateFavorites(int restaurantId) async {
    final currentUserFavorites = await getUserFavorites();
    final favorites = [...currentUserFavorites.favorites];
    if (favorites.contains(restaurantId)) {
      favorites.remove(restaurantId);
    } else {
      favorites.add(restaurantId);
    }
    await _userFavoriteStore.record(_key).update(_db, {'favorites' : favorites});
  }
}