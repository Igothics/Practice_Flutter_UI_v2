import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:practice_food_delivery/src/common_widgets/customized_elevated_button.dart';
import 'package:practice_food_delivery/src/features/authentication/application/auth_provider.dart';
import 'package:practice_food_delivery/src/features/profile/presentation/enable_submit_provider.dart';
import 'package:practice_food_delivery/src/features/profile/presentation/immutable_user_profile_provider.dart';
import 'package:practice_food_delivery/src/features/profile/presentation/is_waiting_provider.dart';
import 'package:practice_food_delivery/src/features/profile/presentation/mutable_user_profile_provider.dart';

class ProfileSubmitButton extends HookConsumerWidget {
  const ProfileSubmitButton({super.key, required this.formKey,});
  final GlobalKey<FormState> formKey;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final enableSubmitButton = ref.watch(enableSubmitProvider);
    final isWaiting = ref.read(isWaitingProvider);

    return CustomElevatedButton(
      enable: enableSubmitButton && !isWaiting,
      onPressed: () async {
        if (formKey.currentState!.validate()) {
          ref.read(isWaitingProvider.notifier).update((state) => true);

          await ref.read(mutableUserProfileProvider.notifier).submit();
          await ref.read(authProvider).reload(ref);
          log('[User Profile Page] : submit done!');
          // use it instead to put a trigger inside immutableUserProfileProvider. No need watcher trick =)). Just remember provider.future
          ref.refresh(immutableUserProfileProvider.future);
          await Future.delayed(const Duration(seconds: 1,),);
          ref.read(isWaitingProvider.notifier).update((state) => false);
        }
      },
      foregroundColor: colorScheme.onPrimaryContainer,
      child: const Text('Submit Changes',),
    );
  }
}
