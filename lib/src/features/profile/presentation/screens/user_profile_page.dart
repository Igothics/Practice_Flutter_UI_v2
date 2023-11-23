import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:practice_food_delivery/src/common_provider/global_key_provider.dart';
import 'package:practice_food_delivery/src/features/profile/presentation/providers/is_submitting_provider.dart';
import 'package:practice_food_delivery/src/features/profile/presentation/widgets/profile_submit_button.dart';
import 'package:practice_food_delivery/src/features/profile/presentation/widgets/user_profile_form_card_builder.dart';

class UserProfilePage extends HookConsumerWidget {
  const UserProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = ref.watch(formStateGlobalKeyProvider);
    final isSubmitting = ref.watch(isSubmittingProvider);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 8.0,),
            UserProfileFormCardBuilder(
              formKey: formKey,
              groupKey: 'user-profile',
              isWaiting: isSubmitting,
            ),
            const SizedBox(height: 8.0,),
            ProfileSubmitButton(formKey: formKey,),
          ],
        ),
      ),
    );
  }
}