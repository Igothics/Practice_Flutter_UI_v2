// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'coupon.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Coupon _$CouponFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'percentage':
      return CouponPercentage.fromJson(json);
    case 'fixValue':
      return CouponFixValue.fromJson(json);
    case 'freeCharge':
      return CouponFreeCharge.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'Coupon',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$Coupon {
  int get id => throw _privateConstructorUsedError;
  String get code => throw _privateConstructorUsedError;
  FeeType get feeType => throw _privateConstructorUsedError;
  bool get available => throw _privateConstructorUsedError;
  int get maxUsageCount => throw _privateConstructorUsedError;
  double get minimumSpend => throw _privateConstructorUsedError;
  DateTime get expirationDate => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            int id,
            String code,
            FeeType feeType,
            bool available,
            int maxUsageCount,
            double value,
            double maxDiscount,
            double minimumSpend,
            DateTime expirationDate)
        percentage,
    required TResult Function(
            int id,
            String code,
            FeeType feeType,
            bool available,
            int maxUsageCount,
            double value,
            double minimumSpend,
            DateTime expirationDate)
        fixValue,
    required TResult Function(
            int id,
            String code,
            FeeType feeType,
            bool available,
            int maxUsageCount,
            double minimumSpend,
            DateTime expirationDate)
        freeCharge,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            int id,
            String code,
            FeeType feeType,
            bool available,
            int maxUsageCount,
            double value,
            double maxDiscount,
            double minimumSpend,
            DateTime expirationDate)?
        percentage,
    TResult? Function(
            int id,
            String code,
            FeeType feeType,
            bool available,
            int maxUsageCount,
            double value,
            double minimumSpend,
            DateTime expirationDate)?
        fixValue,
    TResult? Function(int id, String code, FeeType feeType, bool available,
            int maxUsageCount, double minimumSpend, DateTime expirationDate)?
        freeCharge,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            int id,
            String code,
            FeeType feeType,
            bool available,
            int maxUsageCount,
            double value,
            double maxDiscount,
            double minimumSpend,
            DateTime expirationDate)?
        percentage,
    TResult Function(
            int id,
            String code,
            FeeType feeType,
            bool available,
            int maxUsageCount,
            double value,
            double minimumSpend,
            DateTime expirationDate)?
        fixValue,
    TResult Function(int id, String code, FeeType feeType, bool available,
            int maxUsageCount, double minimumSpend, DateTime expirationDate)?
        freeCharge,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CouponPercentage value) percentage,
    required TResult Function(CouponFixValue value) fixValue,
    required TResult Function(CouponFreeCharge value) freeCharge,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CouponPercentage value)? percentage,
    TResult? Function(CouponFixValue value)? fixValue,
    TResult? Function(CouponFreeCharge value)? freeCharge,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CouponPercentage value)? percentage,
    TResult Function(CouponFixValue value)? fixValue,
    TResult Function(CouponFreeCharge value)? freeCharge,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CouponCopyWith<Coupon> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CouponCopyWith<$Res> {
  factory $CouponCopyWith(Coupon value, $Res Function(Coupon) then) =
      _$CouponCopyWithImpl<$Res, Coupon>;
  @useResult
  $Res call(
      {int id,
      String code,
      FeeType feeType,
      bool available,
      int maxUsageCount,
      double minimumSpend,
      DateTime expirationDate});
}

/// @nodoc
class _$CouponCopyWithImpl<$Res, $Val extends Coupon>
    implements $CouponCopyWith<$Res> {
  _$CouponCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? code = null,
    Object? feeType = null,
    Object? available = null,
    Object? maxUsageCount = null,
    Object? minimumSpend = null,
    Object? expirationDate = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      feeType: null == feeType
          ? _value.feeType
          : feeType // ignore: cast_nullable_to_non_nullable
              as FeeType,
      available: null == available
          ? _value.available
          : available // ignore: cast_nullable_to_non_nullable
              as bool,
      maxUsageCount: null == maxUsageCount
          ? _value.maxUsageCount
          : maxUsageCount // ignore: cast_nullable_to_non_nullable
              as int,
      minimumSpend: null == minimumSpend
          ? _value.minimumSpend
          : minimumSpend // ignore: cast_nullable_to_non_nullable
              as double,
      expirationDate: null == expirationDate
          ? _value.expirationDate
          : expirationDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CouponPercentageImplCopyWith<$Res>
    implements $CouponCopyWith<$Res> {
  factory _$$CouponPercentageImplCopyWith(_$CouponPercentageImpl value,
          $Res Function(_$CouponPercentageImpl) then) =
      __$$CouponPercentageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String code,
      FeeType feeType,
      bool available,
      int maxUsageCount,
      double value,
      double maxDiscount,
      double minimumSpend,
      DateTime expirationDate});
}

/// @nodoc
class __$$CouponPercentageImplCopyWithImpl<$Res>
    extends _$CouponCopyWithImpl<$Res, _$CouponPercentageImpl>
    implements _$$CouponPercentageImplCopyWith<$Res> {
  __$$CouponPercentageImplCopyWithImpl(_$CouponPercentageImpl _value,
      $Res Function(_$CouponPercentageImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? code = null,
    Object? feeType = null,
    Object? available = null,
    Object? maxUsageCount = null,
    Object? value = null,
    Object? maxDiscount = null,
    Object? minimumSpend = null,
    Object? expirationDate = null,
  }) {
    return _then(_$CouponPercentageImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      feeType: null == feeType
          ? _value.feeType
          : feeType // ignore: cast_nullable_to_non_nullable
              as FeeType,
      available: null == available
          ? _value.available
          : available // ignore: cast_nullable_to_non_nullable
              as bool,
      maxUsageCount: null == maxUsageCount
          ? _value.maxUsageCount
          : maxUsageCount // ignore: cast_nullable_to_non_nullable
              as int,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as double,
      maxDiscount: null == maxDiscount
          ? _value.maxDiscount
          : maxDiscount // ignore: cast_nullable_to_non_nullable
              as double,
      minimumSpend: null == minimumSpend
          ? _value.minimumSpend
          : minimumSpend // ignore: cast_nullable_to_non_nullable
              as double,
      expirationDate: null == expirationDate
          ? _value.expirationDate
          : expirationDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CouponPercentageImpl
    with DiagnosticableTreeMixin
    implements CouponPercentage {
  const _$CouponPercentageImpl(
      {required this.id,
      required this.code,
      required this.feeType,
      required this.available,
      required this.maxUsageCount,
      required this.value,
      required this.maxDiscount,
      required this.minimumSpend,
      required this.expirationDate,
      final String? $type})
      : $type = $type ?? 'percentage';

  factory _$CouponPercentageImpl.fromJson(Map<String, dynamic> json) =>
      _$$CouponPercentageImplFromJson(json);

  @override
  final int id;
  @override
  final String code;
  @override
  final FeeType feeType;
  @override
  final bool available;
  @override
  final int maxUsageCount;
  @override
  final double value;
  @override
  final double maxDiscount;
  @override
  final double minimumSpend;
  @override
  final DateTime expirationDate;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Coupon.percentage(id: $id, code: $code, feeType: $feeType, available: $available, maxUsageCount: $maxUsageCount, value: $value, maxDiscount: $maxDiscount, minimumSpend: $minimumSpend, expirationDate: $expirationDate)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Coupon.percentage'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('code', code))
      ..add(DiagnosticsProperty('feeType', feeType))
      ..add(DiagnosticsProperty('available', available))
      ..add(DiagnosticsProperty('maxUsageCount', maxUsageCount))
      ..add(DiagnosticsProperty('value', value))
      ..add(DiagnosticsProperty('maxDiscount', maxDiscount))
      ..add(DiagnosticsProperty('minimumSpend', minimumSpend))
      ..add(DiagnosticsProperty('expirationDate', expirationDate));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CouponPercentageImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.feeType, feeType) || other.feeType == feeType) &&
            (identical(other.available, available) ||
                other.available == available) &&
            (identical(other.maxUsageCount, maxUsageCount) ||
                other.maxUsageCount == maxUsageCount) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.maxDiscount, maxDiscount) ||
                other.maxDiscount == maxDiscount) &&
            (identical(other.minimumSpend, minimumSpend) ||
                other.minimumSpend == minimumSpend) &&
            (identical(other.expirationDate, expirationDate) ||
                other.expirationDate == expirationDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, code, feeType, available,
      maxUsageCount, value, maxDiscount, minimumSpend, expirationDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CouponPercentageImplCopyWith<_$CouponPercentageImpl> get copyWith =>
      __$$CouponPercentageImplCopyWithImpl<_$CouponPercentageImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            int id,
            String code,
            FeeType feeType,
            bool available,
            int maxUsageCount,
            double value,
            double maxDiscount,
            double minimumSpend,
            DateTime expirationDate)
        percentage,
    required TResult Function(
            int id,
            String code,
            FeeType feeType,
            bool available,
            int maxUsageCount,
            double value,
            double minimumSpend,
            DateTime expirationDate)
        fixValue,
    required TResult Function(
            int id,
            String code,
            FeeType feeType,
            bool available,
            int maxUsageCount,
            double minimumSpend,
            DateTime expirationDate)
        freeCharge,
  }) {
    return percentage(id, code, feeType, available, maxUsageCount, value,
        maxDiscount, minimumSpend, expirationDate);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            int id,
            String code,
            FeeType feeType,
            bool available,
            int maxUsageCount,
            double value,
            double maxDiscount,
            double minimumSpend,
            DateTime expirationDate)?
        percentage,
    TResult? Function(
            int id,
            String code,
            FeeType feeType,
            bool available,
            int maxUsageCount,
            double value,
            double minimumSpend,
            DateTime expirationDate)?
        fixValue,
    TResult? Function(int id, String code, FeeType feeType, bool available,
            int maxUsageCount, double minimumSpend, DateTime expirationDate)?
        freeCharge,
  }) {
    return percentage?.call(id, code, feeType, available, maxUsageCount, value,
        maxDiscount, minimumSpend, expirationDate);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            int id,
            String code,
            FeeType feeType,
            bool available,
            int maxUsageCount,
            double value,
            double maxDiscount,
            double minimumSpend,
            DateTime expirationDate)?
        percentage,
    TResult Function(
            int id,
            String code,
            FeeType feeType,
            bool available,
            int maxUsageCount,
            double value,
            double minimumSpend,
            DateTime expirationDate)?
        fixValue,
    TResult Function(int id, String code, FeeType feeType, bool available,
            int maxUsageCount, double minimumSpend, DateTime expirationDate)?
        freeCharge,
    required TResult orElse(),
  }) {
    if (percentage != null) {
      return percentage(id, code, feeType, available, maxUsageCount, value,
          maxDiscount, minimumSpend, expirationDate);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CouponPercentage value) percentage,
    required TResult Function(CouponFixValue value) fixValue,
    required TResult Function(CouponFreeCharge value) freeCharge,
  }) {
    return percentage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CouponPercentage value)? percentage,
    TResult? Function(CouponFixValue value)? fixValue,
    TResult? Function(CouponFreeCharge value)? freeCharge,
  }) {
    return percentage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CouponPercentage value)? percentage,
    TResult Function(CouponFixValue value)? fixValue,
    TResult Function(CouponFreeCharge value)? freeCharge,
    required TResult orElse(),
  }) {
    if (percentage != null) {
      return percentage(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$CouponPercentageImplToJson(
      this,
    );
  }
}

abstract class CouponPercentage implements Coupon {
  const factory CouponPercentage(
      {required final int id,
      required final String code,
      required final FeeType feeType,
      required final bool available,
      required final int maxUsageCount,
      required final double value,
      required final double maxDiscount,
      required final double minimumSpend,
      required final DateTime expirationDate}) = _$CouponPercentageImpl;

  factory CouponPercentage.fromJson(Map<String, dynamic> json) =
      _$CouponPercentageImpl.fromJson;

  @override
  int get id;
  @override
  String get code;
  @override
  FeeType get feeType;
  @override
  bool get available;
  @override
  int get maxUsageCount;
  double get value;
  double get maxDiscount;
  @override
  double get minimumSpend;
  @override
  DateTime get expirationDate;
  @override
  @JsonKey(ignore: true)
  _$$CouponPercentageImplCopyWith<_$CouponPercentageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CouponFixValueImplCopyWith<$Res>
    implements $CouponCopyWith<$Res> {
  factory _$$CouponFixValueImplCopyWith(_$CouponFixValueImpl value,
          $Res Function(_$CouponFixValueImpl) then) =
      __$$CouponFixValueImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String code,
      FeeType feeType,
      bool available,
      int maxUsageCount,
      double value,
      double minimumSpend,
      DateTime expirationDate});
}

/// @nodoc
class __$$CouponFixValueImplCopyWithImpl<$Res>
    extends _$CouponCopyWithImpl<$Res, _$CouponFixValueImpl>
    implements _$$CouponFixValueImplCopyWith<$Res> {
  __$$CouponFixValueImplCopyWithImpl(
      _$CouponFixValueImpl _value, $Res Function(_$CouponFixValueImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? code = null,
    Object? feeType = null,
    Object? available = null,
    Object? maxUsageCount = null,
    Object? value = null,
    Object? minimumSpend = null,
    Object? expirationDate = null,
  }) {
    return _then(_$CouponFixValueImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      feeType: null == feeType
          ? _value.feeType
          : feeType // ignore: cast_nullable_to_non_nullable
              as FeeType,
      available: null == available
          ? _value.available
          : available // ignore: cast_nullable_to_non_nullable
              as bool,
      maxUsageCount: null == maxUsageCount
          ? _value.maxUsageCount
          : maxUsageCount // ignore: cast_nullable_to_non_nullable
              as int,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as double,
      minimumSpend: null == minimumSpend
          ? _value.minimumSpend
          : minimumSpend // ignore: cast_nullable_to_non_nullable
              as double,
      expirationDate: null == expirationDate
          ? _value.expirationDate
          : expirationDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CouponFixValueImpl
    with DiagnosticableTreeMixin
    implements CouponFixValue {
  const _$CouponFixValueImpl(
      {required this.id,
      required this.code,
      required this.feeType,
      required this.available,
      required this.maxUsageCount,
      required this.value,
      required this.minimumSpend,
      required this.expirationDate,
      final String? $type})
      : $type = $type ?? 'fixValue';

  factory _$CouponFixValueImpl.fromJson(Map<String, dynamic> json) =>
      _$$CouponFixValueImplFromJson(json);

  @override
  final int id;
  @override
  final String code;
  @override
  final FeeType feeType;
  @override
  final bool available;
  @override
  final int maxUsageCount;
  @override
  final double value;
  @override
  final double minimumSpend;
  @override
  final DateTime expirationDate;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Coupon.fixValue(id: $id, code: $code, feeType: $feeType, available: $available, maxUsageCount: $maxUsageCount, value: $value, minimumSpend: $minimumSpend, expirationDate: $expirationDate)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Coupon.fixValue'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('code', code))
      ..add(DiagnosticsProperty('feeType', feeType))
      ..add(DiagnosticsProperty('available', available))
      ..add(DiagnosticsProperty('maxUsageCount', maxUsageCount))
      ..add(DiagnosticsProperty('value', value))
      ..add(DiagnosticsProperty('minimumSpend', minimumSpend))
      ..add(DiagnosticsProperty('expirationDate', expirationDate));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CouponFixValueImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.feeType, feeType) || other.feeType == feeType) &&
            (identical(other.available, available) ||
                other.available == available) &&
            (identical(other.maxUsageCount, maxUsageCount) ||
                other.maxUsageCount == maxUsageCount) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.minimumSpend, minimumSpend) ||
                other.minimumSpend == minimumSpend) &&
            (identical(other.expirationDate, expirationDate) ||
                other.expirationDate == expirationDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, code, feeType, available,
      maxUsageCount, value, minimumSpend, expirationDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CouponFixValueImplCopyWith<_$CouponFixValueImpl> get copyWith =>
      __$$CouponFixValueImplCopyWithImpl<_$CouponFixValueImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            int id,
            String code,
            FeeType feeType,
            bool available,
            int maxUsageCount,
            double value,
            double maxDiscount,
            double minimumSpend,
            DateTime expirationDate)
        percentage,
    required TResult Function(
            int id,
            String code,
            FeeType feeType,
            bool available,
            int maxUsageCount,
            double value,
            double minimumSpend,
            DateTime expirationDate)
        fixValue,
    required TResult Function(
            int id,
            String code,
            FeeType feeType,
            bool available,
            int maxUsageCount,
            double minimumSpend,
            DateTime expirationDate)
        freeCharge,
  }) {
    return fixValue(id, code, feeType, available, maxUsageCount, value,
        minimumSpend, expirationDate);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            int id,
            String code,
            FeeType feeType,
            bool available,
            int maxUsageCount,
            double value,
            double maxDiscount,
            double minimumSpend,
            DateTime expirationDate)?
        percentage,
    TResult? Function(
            int id,
            String code,
            FeeType feeType,
            bool available,
            int maxUsageCount,
            double value,
            double minimumSpend,
            DateTime expirationDate)?
        fixValue,
    TResult? Function(int id, String code, FeeType feeType, bool available,
            int maxUsageCount, double minimumSpend, DateTime expirationDate)?
        freeCharge,
  }) {
    return fixValue?.call(id, code, feeType, available, maxUsageCount, value,
        minimumSpend, expirationDate);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            int id,
            String code,
            FeeType feeType,
            bool available,
            int maxUsageCount,
            double value,
            double maxDiscount,
            double minimumSpend,
            DateTime expirationDate)?
        percentage,
    TResult Function(
            int id,
            String code,
            FeeType feeType,
            bool available,
            int maxUsageCount,
            double value,
            double minimumSpend,
            DateTime expirationDate)?
        fixValue,
    TResult Function(int id, String code, FeeType feeType, bool available,
            int maxUsageCount, double minimumSpend, DateTime expirationDate)?
        freeCharge,
    required TResult orElse(),
  }) {
    if (fixValue != null) {
      return fixValue(id, code, feeType, available, maxUsageCount, value,
          minimumSpend, expirationDate);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CouponPercentage value) percentage,
    required TResult Function(CouponFixValue value) fixValue,
    required TResult Function(CouponFreeCharge value) freeCharge,
  }) {
    return fixValue(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CouponPercentage value)? percentage,
    TResult? Function(CouponFixValue value)? fixValue,
    TResult? Function(CouponFreeCharge value)? freeCharge,
  }) {
    return fixValue?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CouponPercentage value)? percentage,
    TResult Function(CouponFixValue value)? fixValue,
    TResult Function(CouponFreeCharge value)? freeCharge,
    required TResult orElse(),
  }) {
    if (fixValue != null) {
      return fixValue(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$CouponFixValueImplToJson(
      this,
    );
  }
}

abstract class CouponFixValue implements Coupon {
  const factory CouponFixValue(
      {required final int id,
      required final String code,
      required final FeeType feeType,
      required final bool available,
      required final int maxUsageCount,
      required final double value,
      required final double minimumSpend,
      required final DateTime expirationDate}) = _$CouponFixValueImpl;

  factory CouponFixValue.fromJson(Map<String, dynamic> json) =
      _$CouponFixValueImpl.fromJson;

  @override
  int get id;
  @override
  String get code;
  @override
  FeeType get feeType;
  @override
  bool get available;
  @override
  int get maxUsageCount;
  double get value;
  @override
  double get minimumSpend;
  @override
  DateTime get expirationDate;
  @override
  @JsonKey(ignore: true)
  _$$CouponFixValueImplCopyWith<_$CouponFixValueImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CouponFreeChargeImplCopyWith<$Res>
    implements $CouponCopyWith<$Res> {
  factory _$$CouponFreeChargeImplCopyWith(_$CouponFreeChargeImpl value,
          $Res Function(_$CouponFreeChargeImpl) then) =
      __$$CouponFreeChargeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String code,
      FeeType feeType,
      bool available,
      int maxUsageCount,
      double minimumSpend,
      DateTime expirationDate});
}

/// @nodoc
class __$$CouponFreeChargeImplCopyWithImpl<$Res>
    extends _$CouponCopyWithImpl<$Res, _$CouponFreeChargeImpl>
    implements _$$CouponFreeChargeImplCopyWith<$Res> {
  __$$CouponFreeChargeImplCopyWithImpl(_$CouponFreeChargeImpl _value,
      $Res Function(_$CouponFreeChargeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? code = null,
    Object? feeType = null,
    Object? available = null,
    Object? maxUsageCount = null,
    Object? minimumSpend = null,
    Object? expirationDate = null,
  }) {
    return _then(_$CouponFreeChargeImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      feeType: null == feeType
          ? _value.feeType
          : feeType // ignore: cast_nullable_to_non_nullable
              as FeeType,
      available: null == available
          ? _value.available
          : available // ignore: cast_nullable_to_non_nullable
              as bool,
      maxUsageCount: null == maxUsageCount
          ? _value.maxUsageCount
          : maxUsageCount // ignore: cast_nullable_to_non_nullable
              as int,
      minimumSpend: null == minimumSpend
          ? _value.minimumSpend
          : minimumSpend // ignore: cast_nullable_to_non_nullable
              as double,
      expirationDate: null == expirationDate
          ? _value.expirationDate
          : expirationDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CouponFreeChargeImpl
    with DiagnosticableTreeMixin
    implements CouponFreeCharge {
  const _$CouponFreeChargeImpl(
      {required this.id,
      required this.code,
      required this.feeType,
      required this.available,
      required this.maxUsageCount,
      required this.minimumSpend,
      required this.expirationDate,
      final String? $type})
      : $type = $type ?? 'freeCharge';

  factory _$CouponFreeChargeImpl.fromJson(Map<String, dynamic> json) =>
      _$$CouponFreeChargeImplFromJson(json);

  @override
  final int id;
  @override
  final String code;
  @override
  final FeeType feeType;
  @override
  final bool available;
  @override
  final int maxUsageCount;
  @override
  final double minimumSpend;
  @override
  final DateTime expirationDate;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Coupon.freeCharge(id: $id, code: $code, feeType: $feeType, available: $available, maxUsageCount: $maxUsageCount, minimumSpend: $minimumSpend, expirationDate: $expirationDate)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Coupon.freeCharge'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('code', code))
      ..add(DiagnosticsProperty('feeType', feeType))
      ..add(DiagnosticsProperty('available', available))
      ..add(DiagnosticsProperty('maxUsageCount', maxUsageCount))
      ..add(DiagnosticsProperty('minimumSpend', minimumSpend))
      ..add(DiagnosticsProperty('expirationDate', expirationDate));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CouponFreeChargeImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.feeType, feeType) || other.feeType == feeType) &&
            (identical(other.available, available) ||
                other.available == available) &&
            (identical(other.maxUsageCount, maxUsageCount) ||
                other.maxUsageCount == maxUsageCount) &&
            (identical(other.minimumSpend, minimumSpend) ||
                other.minimumSpend == minimumSpend) &&
            (identical(other.expirationDate, expirationDate) ||
                other.expirationDate == expirationDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, code, feeType, available,
      maxUsageCount, minimumSpend, expirationDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CouponFreeChargeImplCopyWith<_$CouponFreeChargeImpl> get copyWith =>
      __$$CouponFreeChargeImplCopyWithImpl<_$CouponFreeChargeImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            int id,
            String code,
            FeeType feeType,
            bool available,
            int maxUsageCount,
            double value,
            double maxDiscount,
            double minimumSpend,
            DateTime expirationDate)
        percentage,
    required TResult Function(
            int id,
            String code,
            FeeType feeType,
            bool available,
            int maxUsageCount,
            double value,
            double minimumSpend,
            DateTime expirationDate)
        fixValue,
    required TResult Function(
            int id,
            String code,
            FeeType feeType,
            bool available,
            int maxUsageCount,
            double minimumSpend,
            DateTime expirationDate)
        freeCharge,
  }) {
    return freeCharge(id, code, feeType, available, maxUsageCount, minimumSpend,
        expirationDate);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            int id,
            String code,
            FeeType feeType,
            bool available,
            int maxUsageCount,
            double value,
            double maxDiscount,
            double minimumSpend,
            DateTime expirationDate)?
        percentage,
    TResult? Function(
            int id,
            String code,
            FeeType feeType,
            bool available,
            int maxUsageCount,
            double value,
            double minimumSpend,
            DateTime expirationDate)?
        fixValue,
    TResult? Function(int id, String code, FeeType feeType, bool available,
            int maxUsageCount, double minimumSpend, DateTime expirationDate)?
        freeCharge,
  }) {
    return freeCharge?.call(id, code, feeType, available, maxUsageCount,
        minimumSpend, expirationDate);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            int id,
            String code,
            FeeType feeType,
            bool available,
            int maxUsageCount,
            double value,
            double maxDiscount,
            double minimumSpend,
            DateTime expirationDate)?
        percentage,
    TResult Function(
            int id,
            String code,
            FeeType feeType,
            bool available,
            int maxUsageCount,
            double value,
            double minimumSpend,
            DateTime expirationDate)?
        fixValue,
    TResult Function(int id, String code, FeeType feeType, bool available,
            int maxUsageCount, double minimumSpend, DateTime expirationDate)?
        freeCharge,
    required TResult orElse(),
  }) {
    if (freeCharge != null) {
      return freeCharge(id, code, feeType, available, maxUsageCount,
          minimumSpend, expirationDate);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CouponPercentage value) percentage,
    required TResult Function(CouponFixValue value) fixValue,
    required TResult Function(CouponFreeCharge value) freeCharge,
  }) {
    return freeCharge(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CouponPercentage value)? percentage,
    TResult? Function(CouponFixValue value)? fixValue,
    TResult? Function(CouponFreeCharge value)? freeCharge,
  }) {
    return freeCharge?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CouponPercentage value)? percentage,
    TResult Function(CouponFixValue value)? fixValue,
    TResult Function(CouponFreeCharge value)? freeCharge,
    required TResult orElse(),
  }) {
    if (freeCharge != null) {
      return freeCharge(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$CouponFreeChargeImplToJson(
      this,
    );
  }
}

abstract class CouponFreeCharge implements Coupon {
  const factory CouponFreeCharge(
      {required final int id,
      required final String code,
      required final FeeType feeType,
      required final bool available,
      required final int maxUsageCount,
      required final double minimumSpend,
      required final DateTime expirationDate}) = _$CouponFreeChargeImpl;

  factory CouponFreeCharge.fromJson(Map<String, dynamic> json) =
      _$CouponFreeChargeImpl.fromJson;

  @override
  int get id;
  @override
  String get code;
  @override
  FeeType get feeType;
  @override
  bool get available;
  @override
  int get maxUsageCount;
  @override
  double get minimumSpend;
  @override
  DateTime get expirationDate;
  @override
  @JsonKey(ignore: true)
  _$$CouponFreeChargeImplCopyWith<_$CouponFreeChargeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
