import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:practice_food_delivery/src/common_widgets/simple_text_form_field.dart';
import 'package:practice_food_delivery/src/constants/regex.dart';
import 'package:practice_food_delivery/src/features/profile/presentation/providers/editable_user_profile_provider.dart';
import 'package:practice_food_delivery/src/common_widgets/profile_text_form_field.dart';
import 'package:practice_food_delivery/src/utils/utils.dart';

class DisplayNameTextFormField extends HookConsumerWidget {
  const DisplayNameTextFormField({super.key, this.label, this.controller,});
  final String? label;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userProfile = ref.watch(editableUserProfileProvider);
    final controller = ref.read(editableUserProfileProvider.notifier);

    return userProfile.when(
      error: (error, _) => SimpleTextFormField.error(error),
      loading: () => SimpleTextFormField.loading(label),
      data: (data) => ProfileTextFormField(
        prefixText: label,
        initialValue: data.displayName,
        keyboardType: TextInputType.name,
        inputFormatters: [MaxRangeLimit(20)],
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Please enter some text";
          }
          if (value.characters.length < 6) {
            return "Name should be at least 6 characters";
          }
          if (!RegExp(Regex.name).hasMatch(value)) {
            return "Invalid display name";
          }
          return null;
        },
        onChanged: (value) {
          final clearValue = cleanRedundantSpaces(value);
          controller.updateDisplayName(clearValue);
        },
      ),
    );
  }
}
