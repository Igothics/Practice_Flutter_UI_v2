import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:practice_food_delivery/src/common_widgets/standard_title.dart';
import 'package:practice_food_delivery/src/features/payment/widgets_builder/payment_button_pair_builder.dart';
import 'package:practice_food_delivery/src/features/payment/widgets_builder/radio_list_tile_builder.dart';
import 'package:practice_food_delivery/src/features/payment/widgets_builder/suggestion_action_chip_builder.dart';
import 'package:practice_food_delivery/src/features/payment/widgets_builder/transfer_log_builder.dart';
import 'package:practice_food_delivery/src/features/payment/widgets_builder/transfer_text_field.dart';
import 'package:practice_food_delivery/src/features/payment/widgets_builder/user_balance_card_builder.dart';

class PaymentPage extends HookConsumerWidget {
  const PaymentPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textController = useTextEditingController();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ListView(
          children: [
            const StandardTitle('User Balance',),
            const SizedBox(height: 8.0,),
            const UserBalanceCardBuilder(),
            const SizedBox(height: 16.0,),
            TransferTextField(textController),
            const SizedBox(height: 8.0,),
            PaymentButtonPairBuilder(textController, padding: EdgeInsets.zero,),
            const SizedBox(height: 8.0,),
            const RadioListTileBuilder(),
            const SizedBox(height: 8.0,),
            SuggestionActionChipBuilder(textController),
            const StandardTitle('Transfer log',),
            const TransferLogBuilder(),
            const SizedBox(height: 8.0,),
          ],
        ),
      ),
    );
  }
}
