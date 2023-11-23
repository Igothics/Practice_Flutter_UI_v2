import 'package:practice_food_delivery/src/features/orders_history/data/user_order_repository_provider.dart';
import 'package:practice_food_delivery/src/features/orders_history/domain/user_orders.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'user_order_provider.g.dart';

@riverpod
Stream<UserOrder> userOrders(UserOrdersRef ref) {
  final userOrderRepository = ref.watch(userOrderRepositoryProvider);
  return userOrderRepository.onUserOrderChanged();
}