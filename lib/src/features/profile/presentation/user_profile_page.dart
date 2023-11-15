import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:practice_food_delivery/src/features/profile/presentation/form_key_provider.dart';
import 'package:practice_food_delivery/src/features/profile/presentation/is_waiting_provider.dart';
import 'package:practice_food_delivery/src/features/profile/widgets_builder/profile_submit_button.dart';
import 'package:practice_food_delivery/src/features/profile/widgets_builder/user_profile_form_card_builder.dart';

class UserProfilePage extends HookConsumerWidget {
  const UserProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = ref.watch(formKeyProvider);
    final isWaiting = ref.watch(isWaitingProvider);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 8.0,),
            UserProfileFormCardBuilder(
              formKey: formKey,
              keyGroup: 'user-profile',
              isWaiting: isWaiting,
            ),
            const SizedBox(height: 8.0,),
            ProfileSubmitButton(formKey: formKey,),
          ],
        ),
      ),
    );
  }
}