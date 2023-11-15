// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserSettingsImpl _$$UserSettingsImplFromJson(Map<String, dynamic> json) =>
    _$UserSettingsImpl(
      id: json['id'] as int,
      darkMode: json['darkMode'] as bool,
      seedColor: const ColorConverter().fromJson(json['seedColor'] as int),
    );

Map<String, dynamic> _$$UserSettingsImplToJson(_$UserSettingsImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'darkMode': instance.darkMode,
      'seedColor': const ColorConverter().toJson(instance.seedColor),
    };
