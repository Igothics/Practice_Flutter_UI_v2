import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:practice_food_delivery/src/constants/enum.dart';

part 'user_profile.freezed.dart';
part 'user_profile.g.dart';

@freezed
class UserProfile with _$UserProfile {
  const factory UserProfile({
    required int id,
    required String displayName,
    required String email,
    required String phoneNumber,
    required Gender gender,
    required DateTime birthday,
    required String address,
  }) = _UserProfile;

  factory UserProfile.fromJson(Map<String, dynamic> json) =>
      _$UserProfileFromJson(json);
}