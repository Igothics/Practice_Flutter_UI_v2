import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:practice_food_delivery/src/common_widgets/standard_title.dart';
import 'package:practice_food_delivery/src/features/payment/presentation/providers/user_balance_provider.dart';
import 'package:practice_food_delivery/src/features/payment/presentation/widgets/payment_button_pair_builder.dart';
import 'package:practice_food_delivery/src/features/payment/presentation/widgets/radio_list_tile_builder.dart';
import 'package:practice_food_delivery/src/features/payment/presentation/widgets/suggestion_action_chip_builder.dart';
import 'package:practice_food_delivery/src/features/payment/presentation/widgets/transfer_log_builder.dart';
import 'package:practice_food_delivery/src/features/payment/presentation/widgets/transfer_text_field.dart';
import 'package:practice_food_delivery/src/features/payment/presentation/widgets/user_balance_card_builder.dart';

class PaymentPage extends HookConsumerWidget {
  const PaymentPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textController = useTextEditingController();
    final userBalance = ref.watch(userBalanceProvider);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: userBalance.when(
          error: (error, _) => Text('Error: $error',),
          loading: () => const Center(child: CircularProgressIndicator(),),
          data: (userBalance) => ListView(
            children: [
              const StandardTitle('User Balance',),
              const SizedBox(height: 8.0,),
              UserBalanceCardBuilder(userBalance),
              const SizedBox(height: 16.0,),
              TransferTextField(textController),
              const SizedBox(height: 8.0,),
              PaymentButtonPairBuilder(textController, userBalance),
              const SizedBox(height: 8.0,),
              const RadioListTileBuilder(),
              const SizedBox(height: 8.0,),
              SuggestionActionChipBuilder(textController),
              const StandardTitle('Transfer log',),
              TransferLogBuilder(
                groupKey: 'transfer',
                data: userBalance.transferLog,
                listPadding: EdgeInsets.zero,
              ),
              const SizedBox(height: 8.0,),
            ],
          ),
        ),
      ),
    );
  }
}
