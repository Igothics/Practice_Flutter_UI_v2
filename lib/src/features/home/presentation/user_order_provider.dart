import 'package:practice_food_delivery/src/database/database_repository_provider.dart';
import 'package:practice_food_delivery/src/features/authentication/application/auth_provider.dart';
import 'package:practice_food_delivery/src/features/orders_history/domain/user_orders.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'user_order_provider.g.dart';

@riverpod
Stream<UserOrder> userOrders(UserOrdersRef ref) {
  final database = ref.watch(databaseRepositoryProvider);
  final user = ref.watch(authProvider).currentUser;
  return database.requireValue.onUserOrderChanged(user!.uid);
}