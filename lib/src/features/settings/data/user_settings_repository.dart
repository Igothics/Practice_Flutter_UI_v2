import 'package:flutter/material.dart';
import 'package:practice_food_delivery/src/database/fake_database.dart';
import 'package:practice_food_delivery/src/features/settings/domain/user_settings.dart';
import 'package:sembast/sembast.dart';

class UserSettingsRepository {
  const UserSettingsRepository(this._key, this.database);
  final String _key;
  final FakeDatabase database;
  Database get _db => database.db;
  StoreRef get _userSettingsStore => database.userSettingsStore;

  Future<UserSettings> getUserSettings() async {
    final userSettingsJson = (await _userSettingsStore.record(_key).get(_db)) as Map<String, dynamic>;
    final result = UserSettings.fromJson(userSettingsJson);
    return result;
  }
  Future<void> updateUserSettings(UserSettings userSettings) async {
    final userSettingsJson = userSettings.toJson();
    await _userSettingsStore.record(_key).update(_db, userSettingsJson);
  }

  Stream<UserSettings> onUserSettingsChanged() {
    final userSettingsJson = _userSettingsStore.record(_key)
        .onSnapshot(_db)
        .map((snapshot) => snapshot?.value as Map<String, dynamic>);
    final result = userSettingsJson.map((json) => UserSettings.fromJson(json));
    return result;
  }
  Future<void> updateDarkMode(bool value) async {
    await _userSettingsStore.record(_key).update(_db, {'darkMode': value});
  }
  Future<void> updateSeedColor(Color color) async {
    // we need manually convert color here because don't use to Json
    await _userSettingsStore.record(_key).update(_db, {'seedColor': color.value});
  }
}