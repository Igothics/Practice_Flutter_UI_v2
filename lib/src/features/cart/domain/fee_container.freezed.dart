// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'fee_container.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FeeContainer _$FeeContainerFromJson(Map<String, dynamic> json) {
  return _FeeContainer.fromJson(json);
}

/// @nodoc
mixin _$FeeContainer {
  double get subtotal => throw _privateConstructorUsedError;
  double get deliveryFee => throw _privateConstructorUsedError;
  double get tax => throw _privateConstructorUsedError;
  double get discount => throw _privateConstructorUsedError;
  double get total => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FeeContainerCopyWith<FeeContainer> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FeeContainerCopyWith<$Res> {
  factory $FeeContainerCopyWith(
          FeeContainer value, $Res Function(FeeContainer) then) =
      _$FeeContainerCopyWithImpl<$Res, FeeContainer>;
  @useResult
  $Res call(
      {double subtotal,
      double deliveryFee,
      double tax,
      double discount,
      double total});
}

/// @nodoc
class _$FeeContainerCopyWithImpl<$Res, $Val extends FeeContainer>
    implements $FeeContainerCopyWith<$Res> {
  _$FeeContainerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? subtotal = null,
    Object? deliveryFee = null,
    Object? tax = null,
    Object? discount = null,
    Object? total = null,
  }) {
    return _then(_value.copyWith(
      subtotal: null == subtotal
          ? _value.subtotal
          : subtotal // ignore: cast_nullable_to_non_nullable
              as double,
      deliveryFee: null == deliveryFee
          ? _value.deliveryFee
          : deliveryFee // ignore: cast_nullable_to_non_nullable
              as double,
      tax: null == tax
          ? _value.tax
          : tax // ignore: cast_nullable_to_non_nullable
              as double,
      discount: null == discount
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as double,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FeeContainerImplCopyWith<$Res>
    implements $FeeContainerCopyWith<$Res> {
  factory _$$FeeContainerImplCopyWith(
          _$FeeContainerImpl value, $Res Function(_$FeeContainerImpl) then) =
      __$$FeeContainerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double subtotal,
      double deliveryFee,
      double tax,
      double discount,
      double total});
}

/// @nodoc
class __$$FeeContainerImplCopyWithImpl<$Res>
    extends _$FeeContainerCopyWithImpl<$Res, _$FeeContainerImpl>
    implements _$$FeeContainerImplCopyWith<$Res> {
  __$$FeeContainerImplCopyWithImpl(
      _$FeeContainerImpl _value, $Res Function(_$FeeContainerImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? subtotal = null,
    Object? deliveryFee = null,
    Object? tax = null,
    Object? discount = null,
    Object? total = null,
  }) {
    return _then(_$FeeContainerImpl(
      subtotal: null == subtotal
          ? _value.subtotal
          : subtotal // ignore: cast_nullable_to_non_nullable
              as double,
      deliveryFee: null == deliveryFee
          ? _value.deliveryFee
          : deliveryFee // ignore: cast_nullable_to_non_nullable
              as double,
      tax: null == tax
          ? _value.tax
          : tax // ignore: cast_nullable_to_non_nullable
              as double,
      discount: null == discount
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as double,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FeeContainerImpl with DiagnosticableTreeMixin implements _FeeContainer {
  const _$FeeContainerImpl(
      {this.subtotal = 0.0,
      this.deliveryFee = 0.0,
      this.tax = 0.0,
      this.discount = 0.0,
      this.total = 0.0});

  factory _$FeeContainerImpl.fromJson(Map<String, dynamic> json) =>
      _$$FeeContainerImplFromJson(json);

  @override
  @JsonKey()
  final double subtotal;
  @override
  @JsonKey()
  final double deliveryFee;
  @override
  @JsonKey()
  final double tax;
  @override
  @JsonKey()
  final double discount;
  @override
  @JsonKey()
  final double total;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'FeeContainer(subtotal: $subtotal, deliveryFee: $deliveryFee, tax: $tax, discount: $discount, total: $total)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'FeeContainer'))
      ..add(DiagnosticsProperty('subtotal', subtotal))
      ..add(DiagnosticsProperty('deliveryFee', deliveryFee))
      ..add(DiagnosticsProperty('tax', tax))
      ..add(DiagnosticsProperty('discount', discount))
      ..add(DiagnosticsProperty('total', total));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FeeContainerImpl &&
            (identical(other.subtotal, subtotal) ||
                other.subtotal == subtotal) &&
            (identical(other.deliveryFee, deliveryFee) ||
                other.deliveryFee == deliveryFee) &&
            (identical(other.tax, tax) || other.tax == tax) &&
            (identical(other.discount, discount) ||
                other.discount == discount) &&
            (identical(other.total, total) || other.total == total));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, subtotal, deliveryFee, tax, discount, total);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FeeContainerImplCopyWith<_$FeeContainerImpl> get copyWith =>
      __$$FeeContainerImplCopyWithImpl<_$FeeContainerImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FeeContainerImplToJson(
      this,
    );
  }
}

abstract class _FeeContainer implements FeeContainer {
  const factory _FeeContainer(
      {final double subtotal,
      final double deliveryFee,
      final double tax,
      final double discount,
      final double total}) = _$FeeContainerImpl;

  factory _FeeContainer.fromJson(Map<String, dynamic> json) =
      _$FeeContainerImpl.fromJson;

  @override
  double get subtotal;
  @override
  double get deliveryFee;
  @override
  double get tax;
  @override
  double get discount;
  @override
  double get total;
  @override
  @JsonKey(ignore: true)
  _$$FeeContainerImplCopyWith<_$FeeContainerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
