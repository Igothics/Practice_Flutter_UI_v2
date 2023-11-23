// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_coupon_box.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserCouponBox _$UserCouponBoxFromJson(Map<String, dynamic> json) {
  return _UserCouponBox.fromJson(json);
}

/// @nodoc
mixin _$UserCouponBox {
  int get id => throw _privateConstructorUsedError;
  List<String> get usedCoupons => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserCouponBoxCopyWith<UserCouponBox> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCouponBoxCopyWith<$Res> {
  factory $UserCouponBoxCopyWith(
          UserCouponBox value, $Res Function(UserCouponBox) then) =
      _$UserCouponBoxCopyWithImpl<$Res, UserCouponBox>;
  @useResult
  $Res call({int id, List<String> usedCoupons});
}

/// @nodoc
class _$UserCouponBoxCopyWithImpl<$Res, $Val extends UserCouponBox>
    implements $UserCouponBoxCopyWith<$Res> {
  _$UserCouponBoxCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? usedCoupons = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      usedCoupons: null == usedCoupons
          ? _value.usedCoupons
          : usedCoupons // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserCouponBoxImplCopyWith<$Res>
    implements $UserCouponBoxCopyWith<$Res> {
  factory _$$UserCouponBoxImplCopyWith(
          _$UserCouponBoxImpl value, $Res Function(_$UserCouponBoxImpl) then) =
      __$$UserCouponBoxImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, List<String> usedCoupons});
}

/// @nodoc
class __$$UserCouponBoxImplCopyWithImpl<$Res>
    extends _$UserCouponBoxCopyWithImpl<$Res, _$UserCouponBoxImpl>
    implements _$$UserCouponBoxImplCopyWith<$Res> {
  __$$UserCouponBoxImplCopyWithImpl(
      _$UserCouponBoxImpl _value, $Res Function(_$UserCouponBoxImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? usedCoupons = null,
  }) {
    return _then(_$UserCouponBoxImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      usedCoupons: null == usedCoupons
          ? _value._usedCoupons
          : usedCoupons // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserCouponBoxImpl
    with DiagnosticableTreeMixin
    implements _UserCouponBox {
  const _$UserCouponBoxImpl(
      {required this.id, required final List<String> usedCoupons})
      : _usedCoupons = usedCoupons;

  factory _$UserCouponBoxImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserCouponBoxImplFromJson(json);

  @override
  final int id;
  final List<String> _usedCoupons;
  @override
  List<String> get usedCoupons {
    if (_usedCoupons is EqualUnmodifiableListView) return _usedCoupons;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_usedCoupons);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UserCouponBox(id: $id, usedCoupons: $usedCoupons)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'UserCouponBox'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('usedCoupons', usedCoupons));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserCouponBoxImpl &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality()
                .equals(other._usedCoupons, _usedCoupons));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, const DeepCollectionEquality().hash(_usedCoupons));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserCouponBoxImplCopyWith<_$UserCouponBoxImpl> get copyWith =>
      __$$UserCouponBoxImplCopyWithImpl<_$UserCouponBoxImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserCouponBoxImplToJson(
      this,
    );
  }
}

abstract class _UserCouponBox implements UserCouponBox {
  const factory _UserCouponBox(
      {required final int id,
      required final List<String> usedCoupons}) = _$UserCouponBoxImpl;

  factory _UserCouponBox.fromJson(Map<String, dynamic> json) =
      _$UserCouponBoxImpl.fromJson;

  @override
  int get id;
  @override
  List<String> get usedCoupons;
  @override
  @JsonKey(ignore: true)
  _$$UserCouponBoxImplCopyWith<_$UserCouponBoxImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
