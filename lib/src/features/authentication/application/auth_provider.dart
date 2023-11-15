import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:practice_food_delivery/src/database/database_repository_provider.dart';
import 'package:practice_food_delivery/src/features/authentication/domain/user.dart';

class AuthFake extends ChangeNotifier {
  User? _currentUser;
  User? get currentUser => _currentUser;
  bool get loggedIn => _currentUser != null;

  Future<void> signIn(User user) async {
    log('sign in...');
    _currentUser = user;
    log('user: ${_currentUser?.displayName} logged in!');
    notifyListeners();
  }
  Future<void> reload(WidgetRef ref) async {
    final database = ref.read(databaseRepositoryProvider);
    final user = await database.requireValue.getUserByKey(_currentUser!.id);
    _currentUser = user;
    log('user: ${_currentUser?.displayName} reloaded!');
    // notifyListeners(); Don't notify here. We don't want it trigger GoRouter redirect
  }
  Future<void> signOut() async {
    log('sign out...');
    _currentUser = null;
    log('user: ${_currentUser?.displayName} logged out!');
    notifyListeners();
  }
}

final authProvider = ChangeNotifierProvider((ref) => AuthFake());