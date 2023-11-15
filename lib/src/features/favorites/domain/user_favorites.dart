import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_favorites.freezed.dart';
part 'user_favorites.g.dart';

@freezed
class UserFavorites with _$UserFavorites {
  const factory UserFavorites({
    required int id,
    required List<int> favorites,
  }) = _UserFavorites;

  factory UserFavorites.fromJson(Map<String, dynamic> json) =>
      _$UserFavoritesFromJson(json);
}