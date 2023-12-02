import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:practice_food_delivery/src/common_widgets/contrasting_button_pair.dart';
import 'package:practice_food_delivery/src/constants/enum.dart';
import 'package:practice_food_delivery/src/features/authentication/application/auth_serviced_provider.dart';
import 'package:practice_food_delivery/src/features/payment/data/user_balance_repository_provider.dart';
import 'package:practice_food_delivery/src/features/payment/domain/transfer.dart';
import 'package:practice_food_delivery/src/features/payment/domain/user_balance.dart';
import 'package:practice_food_delivery/src/features/payment/presentation/providers/button_pair_state_provider.dart';
import 'package:practice_food_delivery/src/features/payment/presentation/providers/payment_type_provider.dart';
import 'package:practice_food_delivery/src/utils/utils.dart';

class PaymentButtonPairBuilder extends HookConsumerWidget {
  const PaymentButtonPairBuilder(
    this.textController,
    this.data, {
    super.key,
    this.padding = EdgeInsets.zero,
    this.gap = 16.0,
  });
  final UserBalance data;
  final TextEditingController textController;
  final EdgeInsets? padding;
  final double? gap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //changes from textController could never cause re-render widget => use provider to solve
    final canWithdraw = ref.watch(canWithdrawProvider);
    final canDeposit = ref.watch(canDepositProvider);
    final newTransferId = data.transferLog.length;

    useEffect(() {
      textController.addListener(() {
        ref.read(canDepositProvider.notifier).update((state) {
          final value = double.tryParse(textController.text);
          return value != null && value >= 0;
        });
        ref.read(canWithdrawProvider.notifier).update((state) {
          final value = double.tryParse(textController.text);
          return value != null && value >= 0 && value <= data.balance;
        });
      });
      return null;
    }, []);

    return ContrastingButtonPair(
      leftTitle: 'Withdraw',
      rightTitle: 'Deposit',
      gap: gap,
      padding: padding,
      leftEnabled: canWithdraw,
      rightEnabled: canDeposit,
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
    final user = ref.read(authServiceProvider).currentUser;
    final userBalanceRepository = ref.read(userBalanceRepositoryProvider);
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

    await userBalanceRepository.updateUserBalance(newTransfer).then((wellDone) {
      if (wellDone) {
        context.goNamed(
          'transfer_detail',
          extra: newTransfer,
          pathParameters: {'id': '${newTransfer.id}'},
          queryParameters: {
            'confirm': 'true',
          },
        );
      }
    });
    controller.clear();
  }
}
