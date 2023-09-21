import 'package:practice_food_delivery/src/features/database/database_repository.dart';
import 'package:practice_food_delivery/src/features/database/database_repository_provider.dart';
import 'package:practice_food_delivery/src/features/login/domain/user.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'users_provider.g.dart';

@riverpod
Future<List<User>> users(UsersRef ref) async {
  final database = ref.watch(databaseRepositoryProvider);
  return database.requireValue.getAllUsers();
}
