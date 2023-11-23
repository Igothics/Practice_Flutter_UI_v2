import 'package:practice_food_delivery/src/constants/enum.dart';
import 'package:practice_food_delivery/src/exceptions/user_not_found_exception.dart';
import 'package:practice_food_delivery/src/features/authentication/application/auth_serviced_provider.dart';
import 'package:practice_food_delivery/src/features/authentication/data/user_repository_provider.dart';
import 'package:practice_food_delivery/src/features/profile/data/user_profile_repository_provider.dart';
import 'package:practice_food_delivery/src/features/profile/domain/user_profile.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'editable_user_profile_provider.g.dart';

@riverpod
class EditableUserProfile extends _$EditableUserProfile {
  @override
  FutureOr<UserProfile> build() async {
    final userProfileRepository = ref.watch(userProfileRepositoryProvider);
    return userProfileRepository.getUserProfile();
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
    final user = ref.read(authServiceProvider).currentUser;
    final userRepository = ref.read(userRepositoryProvider);
    final userProfileRepository = ref.read(userProfileRepositoryProvider);
    final userProfile = state.valueOrNull;

    if (user == null || userProfile == null) {
      throw UserNotFound(message: 'There is no user logged in!');
    }

    await userProfileRepository.updateUserProfile(userProfile);
    await userRepository.reflectToUser(user.id, userProfile);
  }
}
