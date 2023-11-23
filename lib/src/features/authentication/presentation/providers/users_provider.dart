import 'package:practice_food_delivery/src/features/authentication/data/user_repository_provider.dart';
import 'package:practice_food_delivery/src/features/authentication/domain/user.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'users_provider.g.dart';

@riverpod
Future<List<User>> users(UsersRef ref) async {
  final userRepository = ref.watch(userRepositoryProvider);
  return userRepository.getAllUsers();
}
