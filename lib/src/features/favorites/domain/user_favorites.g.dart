// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_favorites.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserFavoritesImpl _$$UserFavoritesImplFromJson(Map<String, dynamic> json) =>
    _$UserFavoritesImpl(
      id: json['id'] as int,
      favorites:
          (json['favorites'] as List<dynamic>).map((e) => e as int).toList(),
    );

Map<String, dynamic> _$$UserFavoritesImplToJson(_$UserFavoritesImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'favorites': instance.favorites,
    };
