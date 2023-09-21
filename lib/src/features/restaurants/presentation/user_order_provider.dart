import 'package:practice_food_delivery/src/features/cart/domain/user_orders.dart';
import 'package:practice_food_delivery/src/features/database/database_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'user_order_provider.g.dart';

@riverpod
Stream<UserOrders> userOrders(UserOrdersRef ref, String id) {
  final database = ref.watch(databaseRepositoryProvider);
  return database.requireValue.onUserOrdersChanged(id);
}