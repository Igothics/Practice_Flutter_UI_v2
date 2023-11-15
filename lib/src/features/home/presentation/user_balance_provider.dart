import 'package:practice_food_delivery/src/database/database_repository_provider.dart';
import 'package:practice_food_delivery/src/features/authentication/application/auth_provider.dart';
import 'package:practice_food_delivery/src/features/payment/domain/user_balance.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'user_balance_provider.g.dart';
@riverpod
Stream<UserBalance> userBalance(UserBalanceRef ref) {
  final database = ref.watch(databaseRepositoryProvider);
  final user = ref.watch(authProvider).currentUser;
  if (user == null) return Stream.value(const UserBalance.zero());
  return database.requireValue.onUserBalanceChanged(user.uid);
}