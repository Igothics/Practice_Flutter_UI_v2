import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:practice_food_delivery/src/database/database_repository_provider.dart';
import 'package:practice_food_delivery/src/features/authentication/application/auth_provider.dart';
import 'package:practice_food_delivery/src/features/settings/domain/user_settings.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'user_settings_stream_provider.g.dart';

@riverpod
class UserSettingsStream extends _$UserSettingsStream {
  @override
  Stream<UserSettings?> build() {
    final currentUser = ref.watch(authProvider).currentUser;
    final database = ref.watch(databaseRepositoryProvider).requireValue;
    if (currentUser != null) {
      log('[currentUserSettingsProvider]: fetch for $currentUser');
      return database.onUserSettingsChanged(currentUser.uid);
    }
    log('[currentUserSettingsProvider]: no user logged in');
    return Stream.value(null);
  }

  bool isDarkMode() => state.valueOrNull?.darkMode ?? false;
  bool isEqualSeedColor(Color color) => state.valueOrNull?.seedColor.value == color.value;
  Future<void> updateDarkMode(bool isDark) async {
    final user = ref.read(authProvider.notifier).currentUser;
    final database = ref.read(databaseRepositoryProvider).requireValue;

    if (user != null && state.valueOrNull != null) {
      await database.updateUserSettings(user.uid, state.valueOrNull!.copyWith(darkMode: isDark));
    }
  }
  Future<void> updateSeedColor(Color seedColor) async {
    final user = ref.read(authProvider.notifier).currentUser;
    final database = ref.read(databaseRepositoryProvider).requireValue;

    if (user != null && state.valueOrNull != null) {
      await database.updateUserSettings(user.uid, state.valueOrNull!.copyWith(seedColor: seedColor));
    }
  }
}