import 'package:practice_food_delivery/src/database/database_repository_provider.dart';
import 'package:practice_food_delivery/src/features/authentication/domain/user.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'users_provider.g.dart';

@Riverpod(keepAlive: true)
Future<Map<String, User>> users(UsersRef ref) async {
  final database = ref.watch(databaseRepositoryProvider);
  return await database.requireValue.getAllUsers();
}
