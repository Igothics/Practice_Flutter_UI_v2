import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:practice_food_delivery/src/common_widgets/radio_payment_type_card.dart';
import 'package:practice_food_delivery/src/features/authentication/application/auth_serviced_provider.dart';
import 'package:practice_food_delivery/src/constants/enum.dart';
import 'package:practice_food_delivery/src/features/payment/presentation/providers/payment_type_provider.dart';

class RadioListTileBuilder extends HookConsumerWidget {
  const RadioListTileBuilder({
    super.key,
    this.direction = Axis.horizontal,
    this.listPadding,
    this.gap = 16.0,
    this.margin = EdgeInsets.zero,
    this.contentPadding = EdgeInsets.zero,
  });
  final Axis direction;
  final EdgeInsets? listPadding;
  final double gap;
  final EdgeInsets? margin;
  final EdgeInsets? contentPadding;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    final userId = ref.watch(authServiceProvider).currentUser?.id;
    final paymentTypeController = ref.watch(paymentTypeProvider(userId).notifier);
    final selectedPaymentType = ref.watch(paymentTypeProvider(userId));
    const paymentTypes = PaymentType.values;

    return SizedBox(
      height: 48,
      child: ListView.separated(
        padding: listPadding ?? EdgeInsets.zero,
        scrollDirection: direction,
        itemCount: paymentTypes.length,
        separatorBuilder: (_, __) => SizedBox(width: gap,),
        itemBuilder: (_, index){
          final paymentTypeItem = paymentTypes[index];

          return RadioPaymentTypeCard(
            margin: margin,
            contentPadding: contentPadding,
            value: paymentTypeItem,
            groupValue: selectedPaymentType,
            titles: [
              Icon(paymentTypeItem.icon, color: colorScheme.onSecondaryContainer,),
              Text(paymentTypeItem.value, style: textTheme.bodyMedium?.copyWith(color: colorScheme.onSecondaryContainer),),
            ],
            onChanged: (type) => paymentTypeController.update((state) => type!),
          );
        },
      ),
    );
  }
}
