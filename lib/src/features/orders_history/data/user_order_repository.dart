import 'package:practice_food_delivery/src/database/fake_database.dart';
import 'package:practice_food_delivery/src/features/orders_history/domain/order.dart';
import 'package:practice_food_delivery/src/features/orders_history/domain/user_orders.dart';
import 'package:practice_food_delivery/src/utils/utils.dart';
import 'package:sembast/sembast.dart';

class UserOrderRepository {
  const UserOrderRepository(this._key, this.database);
  final String _key;
  final FakeDatabase database;
  Database get _db => database.db;
  StoreRef get _userOrderStore => database.userOrderStore;

  Stream<UserOrder> onUserOrderChanged() {
    final userOrdersJson = _userOrderStore.record(_key).onSnapshot(_db).map((snapshot) => snapshot?.value as Map<String, dynamic>);
    final result = userOrdersJson.map((json) => UserOrder.fromJson(json));
    return result;
  }
  Future<UserOrder> getUserOrder() async {
    final userOrdersJson = (await _userOrderStore.record(_key).get(_db)) as Map<String, dynamic>;
    return UserOrder.fromJson(userOrdersJson);
  }
  Future<void> updateUserOrder(List<Order> newOrders) async {
    final currentUserOrder = await getUserOrder();
    final newOrderJsons = [
      ...currentUserOrder.orders,
      ...reindex(newOrders, offset: currentUserOrder.orders.length),
    ].map((order) => order.toJson(),).toList();

    await _userOrderStore.record(_key).update(_db, {'orders': newOrderJsons});
  }
}