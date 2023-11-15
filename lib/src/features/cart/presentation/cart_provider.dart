import 'package:practice_food_delivery/src/constants/enum.dart';
import 'package:practice_food_delivery/src/database/database_repository_provider.dart';
import 'package:practice_food_delivery/src/features/authentication/application/auth_provider.dart';
import 'package:practice_food_delivery/src/features/cart/domain/fee_container.dart';
import 'package:practice_food_delivery/src/features/cart/domain/item.dart';
import 'package:practice_food_delivery/src/features/coupons/presentation/chosen_coupon_provider.dart';
import 'package:practice_food_delivery/src/features/coupons/presentation/selected_coupon_index_provider.dart';
import 'package:practice_food_delivery/src/features/orders_history/domain/order.dart';
import 'package:practice_food_delivery/src/features/payment/domain/transfer.dart';
import 'package:practice_food_delivery/src/features/payment/presentation/payment_type_provider.dart';
import 'package:practice_food_delivery/src/utils/utils.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:collection/collection.dart';

part 'cart_provider.g.dart';

@Riverpod(keepAlive: true)
class Cart extends _$Cart {
  @override
  List<Item> build(int? uid) => <Item>[];

  void purgeAllItems() => state = <Item>[];
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
  List<Order> getOrders() => state.map((item) => item.order).toList();
  List<Item> getItems() => [...state];
  Future<bool> checkOut(FeeContainer feeContainer) async {
    final user = ref.read(authProvider).currentUser;
    if (user == null) {
      return false;
    }
    final userUid = user.uid;
    final userId = user.id;
    final database = ref.read(databaseRepositoryProvider);
    final dateTime = DateTime.now();

    final newOrders = getAvailableOrders().map((order) => order.copyWith(date: dateTime,),).toList();
    await database.requireValue.updateUserOrder(userUid, newOrders);

    final paymentType = ref.read(paymentTypeProvider(userId));
    final newTransfer = Transfer(
        amount: fixDouble(feeContainer.total),
        transferType: TransferType.payment,
        paymentType: paymentType,
        transferCode: getRandomTransferCode(),
        referenceCode: getRandomReferenceCode(),
        transferDate: dateTime,
    );
    await database.requireValue.updateUserBalance(userUid, newTransfer);

    final chosenCoupon = ref.read(chosenCouponProvider(userId));
    if (chosenCoupon != null && feeContainer.discount > 0.0) {
      await database.requireValue.updateUserCouponBox(userUid, chosenCoupon.code);
      ref.refresh(chosenCouponProvider(userId));
      ref.refresh(selectedCouponIndexProvider(userId));
    }

    purgeActiveItems();
    return true;
  }
}
