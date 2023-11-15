import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:practice_food_delivery/src/utils/color_converter.dart';

part 'user_settings.freezed.dart';
part 'user_settings.g.dart';

@freezed
class UserSettings with _$UserSettings {
  const factory UserSettings({
    required int id,
    required bool darkMode,
    @ColorConverter() required Color seedColor,
  }) = _UserSettings;



  factory UserSettings.fromJson(Map<String, dynamic> json) =>
      _$UserSettingsFromJson(json);
}
