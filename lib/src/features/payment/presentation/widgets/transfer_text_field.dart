import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:practice_food_delivery/src/constants/regex.dart';
import 'package:practice_food_delivery/src/features/payment/presentation/providers/is_editing_provider.dart';

class TransferTextField extends HookConsumerWidget {
  const TransferTextField(this.textController, {super.key, this.padding,});
  final TextEditingController textController;
  final EdgeInsets? padding;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final focusNode = useFocusNode();
    final suggestion = GoRouterState.of(context).uri.queryParameters['suggestion'];
    final isEditing = ref.watch(isEditingProvider);

    useEffect(() {
      if (suggestion != null) {
        textController.text = suggestion;
        focusNode.requestFocus();
      }
      return null;
    }, []);

    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: TextFormField(
        focusNode: focusNode,
        controller: textController,
        keyboardType: TextInputType.number,
        textInputAction: TextInputAction.done,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        onTap: ()=>ref.read(isEditingProvider.notifier).update((state) => true),
        onTapOutside: (_)=>ref.read(isEditingProvider.notifier).update((state) => false),
        validator: (value){
          if (!isEditing) {
            return null;
          }
          if (value == null || value.isEmpty) {
            return 'Please enter numbers';
          }
          if (!RegExp(Regex.transferAmount).hasMatch(value)) {
            return 'Invalid amount: Please enter positive real number';
          }
          return null;
        },
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
          prefixIcon: const Icon(Icons.attach_money_rounded),
          labelText: 'Amount',
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 1.2, color: colorScheme.onPrimaryContainer),
            borderRadius: BorderRadius.circular(64.0),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(64.0),
          ),
        ),
      ),
    );
  }
}
