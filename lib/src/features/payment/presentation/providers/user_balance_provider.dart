import 'package:practice_food_delivery/src/features/payment/data/user_balance_repository_provider.dart';
import 'package:practice_food_delivery/src/features/payment/domain/user_balance.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'user_balance_provider.g.dart';
@riverpod
Stream<UserBalance> userBalance(UserBalanceRef ref) {
  final userBalanceRepository = ref.watch(userBalanceRepositoryProvider);
  return userBalanceRepository.onUserBalanceChanged();
}