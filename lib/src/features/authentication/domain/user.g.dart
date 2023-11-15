// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      id: json['id'] as int,
      uid: json['uid'] as String,
      displayName: json['displayName'] as String,
      email: json['email'] as String,
      backgroundColor:
          const ColorConverter().fromJson(json['backgroundColor'] as int),
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'uid': instance.uid,
      'displayName': instance.displayName,
      'email': instance.email,
      'backgroundColor':
          const ColorConverter().toJson(instance.backgroundColor),
    };
