import 'package:practice_food_delivery/src/features/profile/data/user_profile_repository_provider.dart';
import 'package:practice_food_delivery/src/features/profile/domain/user_profile.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'user_profile_provider.g.dart';

@riverpod
Future<UserProfile> userProfile(UserProfileRef ref) {
  final userProfileRepository = ref.watch(userProfileRepositoryProvider);
  return userProfileRepository.getUserProfile();
}