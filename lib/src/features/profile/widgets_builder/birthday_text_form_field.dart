import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:practice_food_delivery/src/common_widgets/simple_text_form_field.dart';
import 'package:practice_food_delivery/src/features/profile/presentation/mutable_user_profile_provider.dart';
import 'package:practice_food_delivery/src/common_widgets/profile_text_form_field.dart';
import 'package:practice_food_delivery/src/utils/utils.dart';

class BirthdayTextFormField extends HookConsumerWidget {
  const BirthdayTextFormField({super.key, this.label, this.controller,});

  final String? label;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userProfile = ref.watch(mutableUserProfileProvider);
    final controller = ref.read(mutableUserProfileProvider.notifier);
    final now = DateTime.now().year;
    final firstDate = DateTime(now - 100);
    final lastDate = DateTime(now - 12);

    return userProfile.when(
      error: (error, _) => SimpleTextFormField.error(error),
      loading: () => SimpleTextFormField.loading(label),
      data: (data) => ProfileTextFormField(
        prefixText: label,
        suffixText: formatBirthDate(data.birthday),
        readOnly: true,
        onTap: () async {
          final result = await showDatePicker(
            context: context,
            initialDate: data.birthday,
            firstDate: firstDate,
            lastDate: lastDate,
          );
          if (result != null) {
            controller.updateBirthday(result);
          }
        },
      ),
    );
  }
}
