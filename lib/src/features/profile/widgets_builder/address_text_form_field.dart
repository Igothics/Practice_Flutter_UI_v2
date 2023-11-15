import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:practice_food_delivery/src/common_widgets/simple_text_form_field.dart';
import 'package:practice_food_delivery/src/features/profile/presentation/mutable_user_profile_provider.dart';
import 'package:practice_food_delivery/src/common_widgets/profile_text_form_field.dart';
import 'package:practice_food_delivery/src/utils/utils.dart';

class AddressTextFormField extends HookConsumerWidget {
  const AddressTextFormField({super.key, this.label, this.controller,});
  final String? label;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userProfile = ref.watch(mutableUserProfileProvider);
    final controller = ref.read(mutableUserProfileProvider.notifier);

    return userProfile.when(
      error: (error, _) => SimpleTextFormField.error(error),
      loading: () => SimpleTextFormField.loading(label),
      data: (data) => ProfileTextFormField(
        prefixText: label,
        initialValue: data.address,
        keyboardType: TextInputType.streetAddress,
        withUnderline: false,
        validator: (value){
          if (value == null || value.isEmpty) {
            return "Please enter some text";
          }
          return null;
        },
        onChanged: (value){
          final clearValue = cleanRedundantSpaces(value);
          controller.updateAddress(clearValue);
        },
      ),
    );
  }
}