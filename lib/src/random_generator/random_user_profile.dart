part of 'random_data_generator.dart';

extension UserProfileGroup on RandomData {
  // ignore: unnecessary_nullable_for_final_variable_declarations
  static final _userProfile = UserGroup._users.map((user) => UserProfile(
    id: user.id,
    displayName: user.displayName,
    email: user.email,
    phoneNumber: getRandomPhoneNumber(),
    gender: getRandomGender(),
    birthday: getRandomBirthday(),
    address: getRandomAddress(),
  ),).toList();

  List<UserProfile> get getUserProfiles => _userProfile;
  List<Map<String, dynamic>> get getUserProfileJsons => _userProfile.map((userProfile) => userProfile.toJson()).toList();
}