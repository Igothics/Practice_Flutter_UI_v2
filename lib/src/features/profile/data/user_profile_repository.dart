import 'package:practice_food_delivery/src/database/fake_database.dart';
import 'package:practice_food_delivery/src/features/profile/domain/user_profile.dart';
import 'package:sembast/sembast.dart';

class UserProfileRepository {
  const UserProfileRepository(this._key, this.database);
  final String _key;
  final FakeDatabase database;
  Database get _db => database.db;
  StoreRef get _userProfileStore => database.userProfileStore;

  Future<UserProfile> getUserProfile() async {
    final userProfileJson = (await _userProfileStore.record(_key).get(_db)) as Map<String, dynamic>;
    return UserProfile.fromJson(userProfileJson);
  }
  Future<void> updateUserProfile(UserProfile userProfile) async {
    final userProfileJson = userProfile.toJson();
    await _userProfileStore.record(_key).update(_db, userProfileJson);
  }
}