import 'package:practice_food_delivery/src/database/fake_database.dart';
import 'package:practice_food_delivery/src/features/payment/domain/transfer.dart';
import 'package:practice_food_delivery/src/features/payment/domain/user_balance.dart';
import 'package:practice_food_delivery/src/utils/utils.dart';
import 'package:sembast/sembast.dart';

class UserBalanceRepository {
  const UserBalanceRepository(this._key, this.database);
  final String _key;
  final FakeDatabase database;
  Database get _db => database.db;
  StoreRef get _userBalanceStore => database.userBalanceStore;

  Stream<UserBalance> onUserBalanceChanged() {
    final userBalanceJson = _userBalanceStore.record(_key).onSnapshot(_db).map((snapshot) => snapshot?.value as Map<String, dynamic>);
    final result = userBalanceJson.map((json) => UserBalance.fromJson(json));
    return result;
  }
  Future<UserBalance> getUserBalance() async {
    final userBalanceJson = (await _userBalanceStore.record(_key).get(_db)) as Map<String, dynamic>;
    return UserBalance.fromJson(userBalanceJson);
  }
  Future<bool> updateUserBalance(Transfer newTransfer) async {
    final currentUserBalance = await getUserBalance();
    final newBalance = fixDouble(currentUserBalance.balance + newTransfer.amount * newTransfer.transferType.value);
    if (newBalance < 0) {
      return Future.value(false);
    }
    final newTransferLogJsons = [
      ...currentUserBalance.transferLog,
      newTransfer.copyWith(id: currentUserBalance.transferLog.length),
    ].map((transfer) => transfer.toJson(),).toList();

    await _userBalanceStore.record(_key).update(_db, {
        'balance': newBalance,
        'updateAt': newTransfer.transferDate.toIso8601String(), //Json don't support DateTime Type
        'transferLog': newTransferLogJsons,
      },
    );
    return Future.value(true);
  }
}