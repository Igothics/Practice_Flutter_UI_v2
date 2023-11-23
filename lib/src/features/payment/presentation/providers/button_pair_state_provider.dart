import 'package:hooks_riverpod/hooks_riverpod.dart';

final canWithdrawProvider = AutoDisposeStateProvider<bool>((ref) => false, name: 'canWithdraw',);
final canDepositProvider = AutoDisposeStateProvider<bool>((ref) => false, name: 'canDeposit',);