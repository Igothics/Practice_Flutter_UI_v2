import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:practice_food_delivery/src/common_widgets/customized_elevated_button.dart';
import 'package:practice_food_delivery/src/common_widgets/info_card.dart';
import 'package:practice_food_delivery/src/common_widgets/one_line_info.dart';
import 'package:practice_food_delivery/src/features/payment/domain/transfer.dart';
import 'package:practice_food_delivery/src/utils/extension.dart';
import 'package:practice_food_delivery/src/utils/utils.dart';

class TransferDetailPage extends HookConsumerWidget {
  const TransferDetailPage({super.key,});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;
    final query = GoRouterState.of(context).uri.queryParameters;
    final withConfirmButton = bool.tryParse(query['confirm'] ?? '');
    final transfer = GoRouterState.of(context).extra as Transfer;
    final transferAmount = transfer.amount;
    final transferType = transfer.transferType;
    final paymentType = transfer.paymentType;
    final transferCode = transfer.transferCode;
    final referenceCode = transfer.referenceCode;
    final transferDate = formatDetailDateTime(transfer.transferDate);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Transfer No.${transfer.id}'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            InfoCard(
              children: [
                RichText(
                  text: TextSpan(
                    text: '${transferType.signed}\$',
                    style: textTheme.titleLarge,
                    children: [
                      TextSpan(text: transferAmount.toString(), style: textTheme.headlineLarge),
                    ],
                  ),
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.check_circle, size: 16.0, color: Colors.green,),
                    Text(' Successful',),
                  ],
                ),
                OneLineInfo(labelText: 'Amount', infoText: '$transferAmount',),
                OneLineInfo(labelText: 'Transfer type', infoText: transferType.name.toCapitalize(),),
                OneLineInfo(labelText: 'Payment type', infoText: paymentType.name.toCapitalize(),),
                OneLineInfo(labelText: 'Transfer code', infoText: transferCode,),
                OneLineInfo(labelText: 'Reference code', infoText: referenceCode,),
                OneLineInfo(labelText: 'Transfer date', infoText: transferDate.toString(), bottomDivider: false,),
              ],
            ),
            const Expanded(child: SizedBox()),
            Visibility(
              visible: withConfirmButton ?? false,
              child: CustomElevatedButton(onPressed: ()=> context.pop(), child: const Text('Confirm',),),
            ),
            const SizedBox(height: 8.0,),
          ],
        ),
      ),
    );
  }
}
