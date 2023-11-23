import 'package:practice_food_delivery/src/database/fake_database_provider.dart';
import 'package:practice_food_delivery/src/features/authentication/data/user_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'user_repository_provider.g.dart';
@riverpod
UserRepository userRepository(UserRepositoryRef ref) {
  final database = ref.watch(fakeDatabaseProvider).requireValue;
  return UserRepository(database);
}
