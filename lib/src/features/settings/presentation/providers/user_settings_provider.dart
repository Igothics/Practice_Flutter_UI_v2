import 'package:practice_food_delivery/src/features/settings/data/user_settings_repository_provider.dart';
import 'package:practice_food_delivery/src/features/settings/domain/user_settings.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'user_settings_provider.g.dart';
@riverpod
Stream<UserSettings> userSettings(UserSettingsRef ref) {
  final userSettingsRepository = ref.watch(userSettingsRepositoryProvider);
  return userSettingsRepository.onUserSettingsChanged();
}
