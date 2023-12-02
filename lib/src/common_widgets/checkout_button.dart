import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:practice_food_delivery/src/common_widgets/customized_alert_dialog.dart';

class CheckoutButton extends HookConsumerWidget {
  const CheckoutButton({
    super.key,
    required this.enabled,
    required this.failCheckValue,
    required this.executeCallback,
  });
  final bool enabled;
  final double failCheckValue; //failCheck < 0 ? fail : ok
  final Future<bool> Function() executeCallback;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        foregroundColor: colorScheme.onPrimaryContainer,
        backgroundColor: colorScheme.primaryContainer,
      ),
      onPressed: !enabled ? null : () async {
        if (failCheckValue < 0) {
          return _showFailDialog(context, failCheckValue);
        }
        final checkedOut = await executeCallback();
        if (checkedOut) {
          // ignore: use_build_context_synchronously
          _showSuccessDialog(context);
        }
      },
      child: Text('Checkout',style: textTheme.bodyLarge,),
    );
  }

  void _showFailDialog(BuildContext context, double value) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => CustomizedAlertDialog.failToCheckout(
        context,
        onClosePressed: () => context.pop(),
        onRechargePressed: () => context.goNamed(
          'payment',
          queryParameters: {'suggestion': value.abs().toStringAsFixed(2),},
        ),
      ),
    );
  }
  void _showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => CustomizedAlertDialog.success(
        context,
        onClosePressed: () => context.pop(),
        onHomePressed: () => context.go('/'),
      ),
    );
  }
}
