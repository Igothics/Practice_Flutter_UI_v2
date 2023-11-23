import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:practice_food_delivery/src/common_provider/global_key_provider.dart';
import 'package:practice_food_delivery/src/common_use_hook/use_size_define.dart';

class CustomizedAlertDialog extends HookConsumerWidget {
  const CustomizedAlertDialog({
    super.key,
    this.icon,
    this.title,
    this.titleTextStyle,
    this.content,
    this.contentTextStyle,
    this.actions,
  });
  final Widget? icon;
  final Widget? title;
  final TextStyle? titleTextStyle;
  final Widget? content;
  final TextStyle? contentTextStyle;
  final List<Widget>? actions;

  factory CustomizedAlertDialog.failToCheckout(BuildContext context, {
    VoidCallback? onClosePressed,
    VoidCallback? onRechargePressed,
  }) {
    final colorScheme = Theme.of(context).colorScheme;

    return CustomizedAlertDialog(
      icon: const Icon(Icons.error_outline_rounded, size: 96, color: Colors.red,),
      title: const Text('Not enough money!', style: TextStyle(color: Colors.red),),
      content: const Text('Your account balance is not enough to pay for this order. Please top up your balance to continue.',),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 3,
              child: OutlinedButton(
                onPressed: onClosePressed,
                child: const Text('Close',),
              ),
            ),
            const Expanded(flex: 1,child: SizedBox()),
            Expanded(
              flex:3,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: colorScheme.secondaryContainer),
                onPressed: onRechargePressed,
                child: const Text('Recharge',),
              ),
            ),
          ],
        ),
      ],
    );
  }

  factory CustomizedAlertDialog.success(BuildContext context, {
    VoidCallback? onClosePressed,
    VoidCallback? onHomePressed,
  }) {
    final colorScheme = Theme.of(context).colorScheme;

    return CustomizedAlertDialog(
      icon: const Icon(Icons.task_alt_rounded, size: 96, color: Colors.green,),
      title: const Text('Checkout successful!', style: TextStyle(color: Colors.green),),
      content: const Text('Your order has been paid successfully. We will deliver your order soon. Thank you for using our service.',),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 3,
              child: OutlinedButton(
                onPressed: onClosePressed,
                child: const Text('Close',),
              ),
            ),
            const Expanded(flex: 1,child: SizedBox()),
            Expanded(
              flex:3,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: colorScheme.secondaryContainer),
                onPressed: onHomePressed,
                child: const Text('Home',),
              ),
            ),
          ],
        )
      ],
    );
  }

  static const recordKey = 'dialog';
  static const iconDistance = 104;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    final targetGlobalKey = ref.watch(globalKeyProvider(recordKey));
    final targetSize = useSizeDefine(ref,
      targetGlobalKey: targetGlobalKey,
      targetStringKey: recordKey,
    );
    final height = targetSize.height;

    return Stack(
      children: [
        AlertDialog(
          shape: ContinuousRectangleBorder(borderRadius: BorderRadius.circular(96.0),),
          titlePadding: const EdgeInsets.only(top: 48.0),
          contentPadding: const EdgeInsets.only(left: 24.0, right: 24.0, top: 16.0, bottom: 8.0),
          actionsPadding: const EdgeInsets.symmetric(horizontal: 24.0,vertical: 16.0),
          titleTextStyle: textTheme.bodyLarge,
          contentTextStyle: textTheme.bodyMedium,
          title: Center(child: title!),
          content: SizedBox(
              key: targetGlobalKey,
              child: content,
          ),
          actions: actions,
        ),
        Transform.translate(
          offset: Offset(0.0, - iconDistance - height/2),
          child: Center(
            child: Material(
              elevation: 2.0,
              color: colorScheme.secondaryContainer,
              shape: const CircleBorder(),
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: icon!,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
