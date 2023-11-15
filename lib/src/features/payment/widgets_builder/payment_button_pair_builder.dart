import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:practice_food_delivery/src/common_widgets/contrasting_button_pair.dart';
import 'package:practice_food_delivery/src/constants/enum.dart';
import 'package:practice_food_delivery/src/database/database_repository_provider.dart';
import 'package:practice_food_delivery/src/features/authentication/application/auth_provider.dart';
import 'package:practice_food_delivery/src/features/home/presentation/user_balance_provider.dart';
import 'package:practice_food_delivery/src/features/payment/domain/transfer.dart';
import 'package:practice_food_delivery/src/features/payment/presentation/enable_button_provider.dart';
import 'package:practice_food_delivery/src/features/payment/presentation/payment_type_provider.dart';
import 'package:practice_food_delivery/src/utils/utils.dart';

class PaymentButtonPairBuilder extends HookConsumerWidget {
  const PaymentButtonPairBuilder(
    this.textController, {
    super.key,
    this.padding = const EdgeInsets.symmetric(horizontal: 16.0),
    this.gap = 16.0,
  });

  final TextEditingController textController;
  final EdgeInsets? padding;
  final double? gap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //changes from textController could never cause re-render widget => use provider to solve
    final userBalance = ref.watch(userBalanceProvider);
    final leftEnable = ref.watch(leftEnableProvider);
    final rightEnable = ref.watch(rightEnableProvider);
    final newTransferId = userBalance.when(
      data: (data) => data.transferLog.length,
      error: (error,_) => null,
      loading: ()=> null,
    );

    useEffect(() {
      userBalance.when(
        error: (err, stack) => log('Error: $err'),
        loading: () => log('loading..'),
        data: (data) => textController.addListener(() {
            ref.read(rightEnableProvider.notifier)
                .update((state) {
                  final value = double.tryParse(textController.text);
                  return value != null && value >= 0;
                }
            );

            ref.read(leftEnableProvider.notifier)
                .update((state) {
                  final value = double.tryParse(textController.text);
                  return value != null && value >= 0 && value <= data.balance;
                },
            );
          },
        ),
      );
      return null;
    }, [userBalance]);

    return ContrastingButtonPair(
      leftTitle: 'Withdraw',
      rightTitle: 'Deposit',
      gap: gap,
      padding: padding,
      leftEnabled: leftEnable,
      rightEnabled: rightEnable,
      onLeftPressed: () => _createTransfer(
        context,
        ref,
        transferId: newTransferId,
        transferType: TransferType.withdrawal,
        controller: textController,
      ),
      onRightPressed: () => _createTransfer(
        context,
        ref,
        transferId: newTransferId,
        transferType: TransferType.deposit,
        controller: textController,
      ),
    );
  }

  Future<void> _createTransfer(
    BuildContext context,
    WidgetRef ref, {
    required int? transferId,
    required TransferType transferType,
    required TextEditingController controller,
  }) async {
    final user = ref.read(authProvider).currentUser;
    final database = ref.read(databaseRepositoryProvider).requireValue;
    final paymentType = ref.read(paymentTypeProvider(user?.id));

    final newTransfer = Transfer(
      id: transferId,
      amount: double.parse(controller.text),
      transferType: transferType,
      paymentType: paymentType,
      transferCode: getRandomTransferCode(),
      referenceCode: getRandomReferenceCode(),
      transferDate: DateTime.now(),
    );

    await database.updateUserBalance(user!.uid, newTransfer).then((wellDone){
        if (wellDone) {
          context.goNamed(
            'transfer_detail',
            extra: newTransfer,
            pathParameters: {'id': newTransfer.id.toString()},
            queryParameters: {'confirm': 'true',},
          );
        }
      }
    );
    controller.clear();
  }
}
