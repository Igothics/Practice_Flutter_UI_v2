import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:practice_food_delivery/src/common_widgets/simple_text_form_field.dart';
import 'package:practice_food_delivery/src/constants/enum.dart';
import 'package:practice_food_delivery/src/features/profile/presentation/mutable_user_profile_provider.dart';
import 'package:practice_food_delivery/src/common_widgets/profile_text_form_field.dart';

class GenderTextFormField extends HookConsumerWidget {
  const GenderTextFormField({super.key, this.label, this.controller,});
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
        readOnly: true,
        suffix: PopupMenuButton(
          initialValue: data.gender,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
          position: PopupMenuPosition.under,
          itemBuilder: (_) => [
            for(final gender in Gender.genders.entries) PopupMenuItem(value: gender.value,child: Text(gender.key),),
          ],
          onSelected: (gender) => controller.updateGender(gender),
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0, top: 8.0, bottom: 8.0),
            child: Text(data.gender.value,),
          ),
        ),
      ),
    );
  }
}
