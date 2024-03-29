import 'package:practice_food_delivery/src/constants/enum.dart';
import 'package:practice_food_delivery/src/features/authentication/application/auth_serviced_provider.dart';
import 'package:practice_food_delivery/src/features/cart/domain/fee_container.dart';
import 'package:practice_food_delivery/src/features/cart/domain/item.dart';
import 'package:practice_food_delivery/src/features/coupon_box/data/user_coupon_box_repository_provider.dart';
import 'package:practice_food_delivery/src/features/coupon_box/presentation/providers/chosen_coupon_provider.dart';
import 'package:practice_food_delivery/src/features/coupon_box/presentation/providers/selected_coupon_index_provider.dart';
import 'package:practice_food_delivery/src/features/orders_history/data/user_order_repository_provider.dart';
import 'package:practice_food_delivery/src/features/orders_history/domain/order.dart';
import 'package:practice_food_delivery/src/features/payment/data/user_balance_repository_provider.dart';
import 'package:practice_food_delivery/src/features/payment/domain/transfer.dart';
import 'package:practice_food_delivery/src/features/payment/presentation/providers/payment_type_provider.dart';
import 'package:practice_food_delivery/src/utils/utils.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:collection/collection.dart';

part 'cart_service_provider.g.dart';

@Riverpod(keepAlive: true)
class CartService extends _$CartService {
  @override
  List<Item> build(int? uid) => <Item>[];

  void purgeActiveItems() {
    state = [
      for (int i = 0, index = 0; i < state.length; i++)
        if (!state[i].activated)
          state[i].copyWith(id: index++)
    ];
  }
  void purgeInactiveItems() {
    state = [
      for (int i = 0, index = 0; i < state.length; i++)
        if (state[i].activated)
          state[i].copyWith(id: index++)
    ];
  }
  void addItem(Item newItem) {
    final newId = getId();
    final reindexNewItem = newItem.copyWith.order(id: newId).copyWith(id: newId);
    state = [...state, reindexNewItem];
  }
  void removeItem(int itemId) {
    state = [
      for (int i = 0, index = 0; i < state.length; i++)
        if (state[i].id != itemId)
          state[i].copyWith(id: index++)
    ];
  }
  void addItemFromOrder(Order newOrder){
    final item = findItemWithOrder(newOrder);
    if (item != null) {
      toggleItem(item.id!, keepIt: true);
    } else {
      addItem(Item(order: newOrder));
    }
  }
  Item? findItemWithOrder(Order query){
    final items = getItems();
    final foundItem = items.firstWhereOrNull((item) {
        return (item.order.restaurantName == query.restaurantName) && (item.order.foodName == query.foodName);
      },
    );
    return foundItem;
  }
  void toggleItem(int itemId, {bool? keepIt}) {
    state = [
      for (final item in state)
        if (item.id != itemId)
          item
        else
          item.copyWith(activated: keepIt ?? !item.activated),
    ];
  }
  void deActivateAll() {
    state = [
      for(final item in state)
        if(!item.activated)
          item
        else
          item.copyWith(activated: false),
    ];
  }
  void activateAll() {
    state = [
      for(final item in state)
        if (item.activated)
          item
        else
          item.copyWith(activated: true),
    ];
  }
  bool inactiveCheck() { // no item mean inactive
    if (state.isEmpty) {
      return true;
    }
    for(final item in state) {
      if (!item.activated) {
        return true;
      }
    }
    return false;
  }

  void updateQuantity(int itemId, CartOperation event) {
    final delta = event.value;
    state = [
      for (final item in state)
        if (item.id != itemId)
          item
        else
          if (item.order.quantity == 0 && event == CartOperation.decrease)
            item
          else
            item.copyWith.order(
              quantity: item.order.quantity + delta,
            ),
    ];
  }

  //For calculation
  int getId() => state.length;
  List<Item> getAvailableItems() => state.where((item) => item.activated).toList();
  List<Order> getAvailableOrders() => getAvailableItems().map((item) => item.order).toList();
  List<Item> getItems() => [...state];
  Future<bool> checkOut(FeeContainer feeContainer) async {
    final userId = ref.read(authServiceProvider).currentUser?.id;
    if (userId == null) {
      return false;
    }
    final userOrderRepository = ref.read(userOrderRepositoryProvider);
    final userBalanceRepository = ref.read(userBalanceRepositoryProvider);
    final userCouponBoxRepository = ref.read(userCouponBoxRepositoryProvider);
    final dateTime = DateTime.now();

    final newOrders = getAvailableOrders().map((order) => order.copyWith(date: dateTime,),).toList();
    await userOrderRepository.updateUserOrder(newOrders);

    final paymentType = ref.read(paymentTypeProvider(userId));
    final newTransfer = Transfer(
        amount: fixDouble(feeContainer.total),
        transferType: TransferType.payment,
        paymentType: paymentType,
        transferCode: getRandomTransferCode(),
        referenceCode: getRandomReferenceCode(),
        transferDate: dateTime,
    );
    await userBalanceRepository.updateUserBalance(newTransfer);

    final chosenCoupon = ref.read(chosenCouponProvider(userId));
    if (chosenCoupon != null && feeContainer.discount > 0.0) {
      await userCouponBoxRepository.updateUserCouponBox( chosenCoupon.code);
      ref.invalidate(chosenCouponProvider(userId));
      ref.invalidate(selectedCouponIndexProvider(userId));
    }

    purgeActiveItems();
    return true;
  }
}
