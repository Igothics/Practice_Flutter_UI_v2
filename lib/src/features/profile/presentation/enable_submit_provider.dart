import 'dart:developer';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:practice_food_delivery/src/features/profile/presentation/immutable_user_profile_provider.dart';
import 'package:practice_food_delivery/src/features/profile/presentation/mutable_user_profile_provider.dart';

final enableSubmitProvider = Provider.autoDispose<bool>((ref) {
  final refProfile = ref.watch(immutableUserProfileProvider).valueOrNull;
  final editedProfile = ref.watch(mutableUserProfileProvider).valueOrNull;
  if (refProfile == null || editedProfile == null) {
    return false;
  }
  log('[Enable submit button]: update');
  return editedProfile != refProfile;
});
