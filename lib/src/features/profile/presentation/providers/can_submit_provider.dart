import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:practice_food_delivery/src/features/profile/presentation/providers/user_profile_provider.dart';
import 'package:practice_food_delivery/src/features/profile/presentation/providers/editable_user_profile_provider.dart';

final canSubmitProvider = AutoDisposeProvider<bool>(
  (ref) {
    final refProfile = ref.watch(userProfileProvider).valueOrNull;
    final editableProfile = ref.watch(editableUserProfileProvider).valueOrNull;
    if (refProfile == null || editableProfile == null) {
      return false;
    }
    return editableProfile != refProfile;
  },
  name: 'canSubmit',
);
