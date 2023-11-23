import 'package:practice_food_delivery/src/database/fake_database.dart';
import 'package:practice_food_delivery/src/features/authentication/domain/user.dart';
import 'package:practice_food_delivery/src/features/profile/domain/user_profile.dart';
import 'package:sembast/sembast.dart';

class UserRepository {
  const UserRepository(this.database);
  final FakeDatabase database;
  Database get _db => database.db;
  StoreRef get _userStore => database.userStore;

  Future<void> updateUser(int id, User user) async {
    final userJson = user.toJson();
    await _userStore.record(id).update(_db, userJson);
  }
  Future<List<User>> getAllUsers() async {
    final userJsons = (await _userStore.find(_db)).map((record) => record.value as Map<String, dynamic>);
    final users = userJsons.map((json) => User.fromJson(json)).toList();
    return users;
  }
  Future<User> getUserById(int id) async {
    final userJson = (await _userStore.record(id).get(_db)) as Map<String, dynamic>;
    return User.fromJson(userJson);
  }
  Future<void> reflectToUser(int id, UserProfile userProfile) async {
    await _userStore.record(id).update(_db, {'displayName': userProfile.displayName, 'email': userProfile.email,},);
  }
}
