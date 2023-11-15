import 'dart:developer';

import 'package:practice_food_delivery/src/database/database_repository_provider.dart';
import 'package:practice_food_delivery/src/features/authentication/application/auth_provider.dart';
import 'package:practice_food_delivery/src/features/profile/domain/user_profile.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'immutable_user_profile_provider.g.dart';

@riverpod
Future<UserProfile> immutableUserProfile(ImmutableUserProfileRef ref) async {
  final user = ref.watch(authProvider).currentUser;
  final database = ref.watch(databaseRepositoryProvider);
  final userProfile = database.requireValue.getUserProfileByKey(user!.uid);
  log('[Immutable profile]: loaded');
  return userProfile;
}
