part of 'random_data_generator.dart';

extension UserBalanceGroup on RandomData {
  static final _transactions = List.generate(
    RandomData._maxUserTransactionCount, (index) {
      return Transfer(
        id: index,
        amount: getRandomTransferAmount(),
        transferType: getRandomTransferType(),
        paymentType: getRandomPaymentType(),
        transferCode: getRandomTransferCode(),
        referenceCode: getRandomReferenceCode(),
        transferDate: getRandomBackwardDate(),
      );
    },
  )..sort((a, b) => a.transferDate.compareTo(b.transferDate),);
  static final  _userBalances = List.generate(
    RandomData._maxUserCount, (index) {
      final dates = _transactions.map((e) => e.transferDate);
      return UserBalance(
        id: index,
        balance: getRandomBalance(),
        createAt: dates.first,
        updateAt: dates.last,
        transferLog: reindex(getRandomList(_transactions, shuffle: false,),),
      );
    },
  );
  List<UserBalance> get getUserBalances => _userBalances;
  List<Map<String, dynamic>> get getUserBalanceJsons => _userBalances.map((userBalance) => userBalance.toJson()).toList();
}