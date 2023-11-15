// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_favorites.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserFavorites _$UserFavoritesFromJson(Map<String, dynamic> json) {
  return _UserFavorites.fromJson(json);
}

/// @nodoc
mixin _$UserFavorites {
  int get id => throw _privateConstructorUsedError;
  List<int> get favorites => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserFavoritesCopyWith<UserFavorites> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserFavoritesCopyWith<$Res> {
  factory $UserFavoritesCopyWith(
          UserFavorites value, $Res Function(UserFavorites) then) =
      _$UserFavoritesCopyWithImpl<$Res, UserFavorites>;
  @useResult
  $Res call({int id, List<int> favorites});
}

/// @nodoc
class _$UserFavoritesCopyWithImpl<$Res, $Val extends UserFavorites>
    implements $UserFavoritesCopyWith<$Res> {
  _$UserFavoritesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? favorites = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      favorites: null == favorites
          ? _value.favorites
          : favorites // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserFavoritesImplCopyWith<$Res>
    implements $UserFavoritesCopyWith<$Res> {
  factory _$$UserFavoritesImplCopyWith(
          _$UserFavoritesImpl value, $Res Function(_$UserFavoritesImpl) then) =
      __$$UserFavoritesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, List<int> favorites});
}

/// @nodoc
class __$$UserFavoritesImplCopyWithImpl<$Res>
    extends _$UserFavoritesCopyWithImpl<$Res, _$UserFavoritesImpl>
    implements _$$UserFavoritesImplCopyWith<$Res> {
  __$$UserFavoritesImplCopyWithImpl(
      _$UserFavoritesImpl _value, $Res Function(_$UserFavoritesImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? favorites = null,
  }) {
    return _then(_$UserFavoritesImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      favorites: null == favorites
          ? _value._favorites
          : favorites // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserFavoritesImpl
    with DiagnosticableTreeMixin
    implements _UserFavorites {
  const _$UserFavoritesImpl(
      {required this.id, required final List<int> favorites})
      : _favorites = favorites;

  factory _$UserFavoritesImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserFavoritesImplFromJson(json);

  @override
  final int id;
  final List<int> _favorites;
  @override
  List<int> get favorites {
    if (_favorites is EqualUnmodifiableListView) return _favorites;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_favorites);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UserFavorites(id: $id, favorites: $favorites)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'UserFavorites'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('favorites', favorites));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserFavoritesImpl &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality()
                .equals(other._favorites, _favorites));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, const DeepCollectionEquality().hash(_favorites));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserFavoritesImplCopyWith<_$UserFavoritesImpl> get copyWith =>
      __$$UserFavoritesImplCopyWithImpl<_$UserFavoritesImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserFavoritesImplToJson(
      this,
    );
  }
}

abstract class _UserFavorites implements UserFavorites {
  const factory _UserFavorites(
      {required final int id,
      required final List<int> favorites}) = _$UserFavoritesImpl;

  factory _UserFavorites.fromJson(Map<String, dynamic> json) =
      _$UserFavoritesImpl.fromJson;

  @override
  int get id;
  @override
  List<int> get favorites;
  @override
  @JsonKey(ignore: true)
  _$$UserFavoritesImplCopyWith<_$UserFavoritesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
