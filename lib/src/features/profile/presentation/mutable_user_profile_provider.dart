import 'dart:developer';

import 'package:practice_food_delivery/src/constants/enum.dart';
import 'package:practice_food_delivery/src/database/database_repository_provider.dart';
import 'package:practice_food_delivery/src/features/authentication/application/auth_provider.dart';
import 'package:practice_food_delivery/src/features/profile/domain/user_profile.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'mutable_user_profile_provider.g.dart';

@riverpod
class MutableUserProfile extends _$MutableUserProfile {
  @override
  FutureOr<UserProfile> build() async {
    final user = ref.watch(authProvider).currentUser;
    final database = ref.watch(databaseRepositoryProvider);
    final userProfile = database.requireValue.getUserProfileByKey(user!.uid);

    return userProfile;
  }
  Future<void> updateDisplayName(String displayName) async {
    state = const AsyncLoading();
    state =  await AsyncValue.guard(() => Future.value(state.requireValue.copyWith(displayName: displayName,),),);
  }
  Future<void> updateEmail(String email) async {
    state = const AsyncLoading();
    state =  await AsyncValue.guard(() => Future.value(state.requireValue.copyWith(email: email,),),);
  }
  Future<void> updatePhoneNumber(String phoneNumber) async {
    state = const AsyncLoading();
    state =  await AsyncValue.guard(() => Future.value(state.requireValue.copyWith(phoneNumber: phoneNumber,),),);
  }
  Future<void> updateGender(Gender gender) async {
    state = const AsyncLoading();
    state =  await AsyncValue.guard(() => Future.value(state.requireValue.copyWith(gender: gender,),),);
  }
  Future<void> updateBirthday(DateTime birthday) async {
    state = const AsyncLoading();
    state =  await AsyncValue.guard(() => Future.value(state.requireValue.copyWith(birthday: birthday,),),);
  }
  Future<void> updateAddress(String address) async {
    state = const AsyncLoading();
    state =  await AsyncValue.guard(() => Future.value(state.requireValue.copyWith(address: address,),),);
  }
  Future<void> submit() async {
    final auth = ref.watch(authProvider);
    final user = auth.currentUser;
    final database = ref.read(databaseRepositoryProvider).valueOrNull;
    final userProfile = state.valueOrNull;
    if (database != null && userProfile != null) {
      await database.updateUserProfile(user!.uid, userProfile);
      await database.reflectToUser(user.id, userProfile);
      log('[Mutable Profile]: Submit done!');
    } else {
      log('[Mutable Profile]: It\'s not ready!');
    }
  }
}
