import 'package:practice_food_delivery/src/database/fake_database_provider.dart';
import 'package:practice_food_delivery/src/exceptions/user_not_found_exception.dart';
import 'package:practice_food_delivery/src/features/authentication/application/auth_serviced_provider.dart';
import 'package:practice_food_delivery/src/features/profile/data/user_profile_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'user_profile_repository_provider.g.dart';
@riverpod
UserProfileRepository userProfileRepository(UserProfileRepositoryRef ref) {
  final uid = ref.watch(authServiceProvider).uid;
  if (uid == null) {
    throw UserNotFound(message: "There is no user logged in!");
  }
  final database = ref.watch(fakeDatabaseProvider).requireValue;
  return UserProfileRepository(uid, database);
}