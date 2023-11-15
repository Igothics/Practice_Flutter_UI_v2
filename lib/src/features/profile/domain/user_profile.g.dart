// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserProfileImpl _$$UserProfileImplFromJson(Map<String, dynamic> json) =>
    _$UserProfileImpl(
      id: json['id'] as int,
      displayName: json['displayName'] as String,
      email: json['email'] as String,
      phoneNumber: json['phoneNumber'] as String,
      gender: $enumDecode(_$GenderEnumMap, json['gender']),
      birthday: DateTime.parse(json['birthday'] as String),
      address: json['address'] as String,
    );

Map<String, dynamic> _$$UserProfileImplToJson(_$UserProfileImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'displayName': instance.displayName,
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
      'gender': _$GenderEnumMap[instance.gender]!,
      'birthday': instance.birthday.toIso8601String(),
      'address': instance.address,
    };

const _$GenderEnumMap = {
  Gender.female: 'female',
  Gender.male: 'male',
  Gender.nonbinary: 'nonbinary',
  Gender.genderqueer: 'genderqueer',
  Gender.agender: 'agender',
  Gender.bigender: 'bigender',
  Gender.genderfluid: 'genderfluid',
  Gender.twospirit: 'twospirit',
};
