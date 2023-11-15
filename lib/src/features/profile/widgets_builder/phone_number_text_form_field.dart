import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:practice_food_delivery/src/common_widgets/simple_text_form_field.dart';
import 'package:practice_food_delivery/src/constants/regex.dart';
import 'package:practice_food_delivery/src/features/profile/presentation/mutable_user_profile_provider.dart';
import 'package:practice_food_delivery/src/common_widgets/profile_text_form_field.dart';

class PhoneNumberTextFormField extends HookConsumerWidget {
  const PhoneNumberTextFormField({
    super.key,
    this.label,
    this.controller,
  });
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
        initialValue: data.phoneNumber,
        keyboardType: TextInputType.phone,
        inputFormatters: [MaxRangeLimit(10),],
        textStyle: const TextStyle(letterSpacing: 2.0),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Please enter numbers";
          }
          if (RegExp(Regex.spaces).hasMatch(value)) {
            return 'Invalid phone number: please remove white space';
          }
          if (value.length != 10) {
            return 'Invalid phone number: enter 10 digits please';
          }
          if (value.characters.first != '0') {
            return 'Invalid phone number: must start with 0';
          }
          return null;
        },
        onChanged: (value) => controller.updatePhoneNumber(value),
      ),
    );
  }
}