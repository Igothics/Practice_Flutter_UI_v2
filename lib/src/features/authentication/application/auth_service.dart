import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:practice_food_delivery/src/exceptions/user_not_found_exception.dart';
import 'package:practice_food_delivery/src/features/authentication/data/user_repository_provider.dart';
import 'package:practice_food_delivery/src/features/authentication/domain/user.dart';

class AuthService extends ChangeNotifier {
  User? _currentUser;
  String? _uid;
  User? get currentUser => _currentUser;
  String? get uid => _uid;
  bool get loggedIn => _currentUser != null;

  Future<void> signIn(User user) async {
    log('[AuthService]: signing in...');
    _currentUser = user;
    _uid = user.uid;
    // sign in new user will update new uid.
    log('[AuthService]: ${_currentUser?.displayName} logged in!');
    notifyListeners();
  }
  Future<void> reload(WidgetRef ref) async {
    log('[AuthService]: reloading...');
    if (_currentUser == null) {
      throw UserNotFound(message: "There is no user logged in!");
    }
    final userRepository = ref.read(userRepositoryProvider);
    final user = await userRepository.getUserById(_currentUser!.id);
    _currentUser = user;
    //reload no need update uid. It's the same.
    log('[AuthService]: ${_currentUser?.displayName} reloaded!');
    // notifyListeners(); Don't notify here. We don't want it trigger GoRouter redirect
  }
  Future<void> signOut() async {
    log('[AuthService]: signing out...');
    _currentUser = null;
    // sign out no need update uid. Keep the last uid to show last user info before jump out to login screen
    log('[AuthService]: ${_currentUser?.displayName} logged out!');
    notifyListeners();
  }
}