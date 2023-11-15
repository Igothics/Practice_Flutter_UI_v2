// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserSettings _$UserSettingsFromJson(Map<String, dynamic> json) {
  return _UserSettings.fromJson(json);
}

/// @nodoc
mixin _$UserSettings {
  int get id => throw _privateConstructorUsedError;
  bool get darkMode => throw _privateConstructorUsedError;
  @ColorConverter()
  Color get seedColor => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserSettingsCopyWith<UserSettings> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserSettingsCopyWith<$Res> {
  factory $UserSettingsCopyWith(
          UserSettings value, $Res Function(UserSettings) then) =
      _$UserSettingsCopyWithImpl<$Res, UserSettings>;
  @useResult
  $Res call({int id, bool darkMode, @ColorConverter() Color seedColor});
}

/// @nodoc
class _$UserSettingsCopyWithImpl<$Res, $Val extends UserSettings>
    implements $UserSettingsCopyWith<$Res> {
  _$UserSettingsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? darkMode = null,
    Object? seedColor = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      darkMode: null == darkMode
          ? _value.darkMode
          : darkMode // ignore: cast_nullable_to_non_nullable
              as bool,
      seedColor: null == seedColor
          ? _value.seedColor
          : seedColor // ignore: cast_nullable_to_non_nullable
              as Color,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserSettingsImplCopyWith<$Res>
    implements $UserSettingsCopyWith<$Res> {
  factory _$$UserSettingsImplCopyWith(
          _$UserSettingsImpl value, $Res Function(_$UserSettingsImpl) then) =
      __$$UserSettingsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, bool darkMode, @ColorConverter() Color seedColor});
}

/// @nodoc
class __$$UserSettingsImplCopyWithImpl<$Res>
    extends _$UserSettingsCopyWithImpl<$Res, _$UserSettingsImpl>
    implements _$$UserSettingsImplCopyWith<$Res> {
  __$$UserSettingsImplCopyWithImpl(
      _$UserSettingsImpl _value, $Res Function(_$UserSettingsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? darkMode = null,
    Object? seedColor = null,
  }) {
    return _then(_$UserSettingsImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      darkMode: null == darkMode
          ? _value.darkMode
          : darkMode // ignore: cast_nullable_to_non_nullable
              as bool,
      seedColor: null == seedColor
          ? _value.seedColor
          : seedColor // ignore: cast_nullable_to_non_nullable
              as Color,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserSettingsImpl with DiagnosticableTreeMixin implements _UserSettings {
  const _$UserSettingsImpl(
      {required this.id,
      required this.darkMode,
      @ColorConverter() required this.seedColor});

  factory _$UserSettingsImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserSettingsImplFromJson(json);

  @override
  final int id;
  @override
  final bool darkMode;
  @override
  @ColorConverter()
  final Color seedColor;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UserSettings(id: $id, darkMode: $darkMode, seedColor: $seedColor)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'UserSettings'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('darkMode', darkMode))
      ..add(DiagnosticsProperty('seedColor', seedColor));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserSettingsImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.darkMode, darkMode) ||
                other.darkMode == darkMode) &&
            (identical(other.seedColor, seedColor) ||
                other.seedColor == seedColor));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, darkMode, seedColor);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserSettingsImplCopyWith<_$UserSettingsImpl> get copyWith =>
      __$$UserSettingsImplCopyWithImpl<_$UserSettingsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserSettingsImplToJson(
      this,
    );
  }
}

abstract class _UserSettings implements UserSettings {
  const factory _UserSettings(
      {required final int id,
      required final bool darkMode,
      @ColorConverter() required final Color seedColor}) = _$UserSettingsImpl;

  factory _UserSettings.fromJson(Map<String, dynamic> json) =
      _$UserSettingsImpl.fromJson;

  @override
  int get id;
  @override
  bool get darkMode;
  @override
  @ColorConverter()
  Color get seedColor;
  @override
  @JsonKey(ignore: true)
  _$$UserSettingsImplCopyWith<_$UserSettingsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
