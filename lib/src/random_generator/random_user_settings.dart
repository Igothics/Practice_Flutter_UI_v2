part of 'random_data_generator.dart';

extension UserSettingsGroup on RandomData {
  static final _userSettings = List.generate(
    RandomData._maxUserCount,(index) {
      return UserSettings(
        id: index,
        darkMode: getRandomDarkModeState(),
        seedColor: getRandomColor(),
      );
    },
  );

  List<UserSettings> get getUserSettings => _userSettings;
  List<Map<String, dynamic>> get getUserSettingJsons => _userSettings.map((userSettings) => userSettings.toJson()).toList();
}