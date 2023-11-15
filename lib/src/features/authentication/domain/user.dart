import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:practice_food_delivery/src/utils/color_converter.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User{
  const factory User({
    required int id,
    required String uid,
    required String displayName,
    required String email,
    @ColorConverter() required Color backgroundColor,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) =>
      _$UserFromJson(json);
}