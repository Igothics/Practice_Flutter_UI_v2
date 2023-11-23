import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:practice_food_delivery/src/common_widgets/customized_elevated_button.dart';
import 'package:practice_food_delivery/src/features/authentication/application/auth_serviced_provider.dart';
import 'package:practice_food_delivery/src/features/profile/presentation/providers/can_submit_provider.dart';
import 'package:practice_food_delivery/src/features/profile/presentation/providers/user_profile_provider.dart';
import 'package:practice_food_delivery/src/features/profile/presentation/providers/is_submitting_provider.dart';
import 'package:practice_food_delivery/src/features/profile/presentation/providers/editable_user_profile_provider.dart';
class ProfileSubmitButton extends HookConsumerWidget {
  const ProfileSubmitButton({super.key, required this.formKey,});
  final GlobalKey<FormState> formKey;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final canSubmit = ref.watch(canSubmitProvider);
    final isSubmitting = ref.watch(isSubmittingProvider);

    return CustomElevatedButton(
      enable: canSubmit && !isSubmitting,
      onPressed: () async {
        if (formKey.currentState!.validate()) {
          ref.read(isSubmittingProvider.notifier).update((state) => true);

          await ref.read(editableUserProfileProvider.notifier).submit();
          await ref.read(authServiceProvider).reload(ref);

          ref.invalidate(userProfileProvider);

          ref.read(isSubmittingProvider.notifier).update((state) => false);
        }
      },
      foregroundColor: colorScheme.onPrimaryContainer,
      child: const Text('Submit Changes',),
    );
  }
}
