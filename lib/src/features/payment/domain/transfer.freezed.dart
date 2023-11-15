// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transfer.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Transfer _$TransferFromJson(Map<String, dynamic> json) {
  return _Transfer.fromJson(json);
}

/// @nodoc
mixin _$Transfer {
  int? get id => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;
  TransferType get transferType => throw _privateConstructorUsedError;
  PaymentType get paymentType => throw _privateConstructorUsedError;
  String get transferCode => throw _privateConstructorUsedError;
  String get referenceCode => throw _privateConstructorUsedError;
  DateTime get transferDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TransferCopyWith<Transfer> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransferCopyWith<$Res> {
  factory $TransferCopyWith(Transfer value, $Res Function(Transfer) then) =
      _$TransferCopyWithImpl<$Res, Transfer>;
  @useResult
  $Res call(
      {int? id,
      double amount,
      TransferType transferType,
      PaymentType paymentType,
      String transferCode,
      String referenceCode,
      DateTime transferDate});
}

/// @nodoc
class _$TransferCopyWithImpl<$Res, $Val extends Transfer>
    implements $TransferCopyWith<$Res> {
  _$TransferCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? amount = null,
    Object? transferType = null,
    Object? paymentType = null,
    Object? transferCode = null,
    Object? referenceCode = null,
    Object? transferDate = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      transferType: null == transferType
          ? _value.transferType
          : transferType // ignore: cast_nullable_to_non_nullable
              as TransferType,
      paymentType: null == paymentType
          ? _value.paymentType
          : paymentType // ignore: cast_nullable_to_non_nullable
              as PaymentType,
      transferCode: null == transferCode
          ? _value.transferCode
          : transferCode // ignore: cast_nullable_to_non_nullable
              as String,
      referenceCode: null == referenceCode
          ? _value.referenceCode
          : referenceCode // ignore: cast_nullable_to_non_nullable
              as String,
      transferDate: null == transferDate
          ? _value.transferDate
          : transferDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TransferImplCopyWith<$Res>
    implements $TransferCopyWith<$Res> {
  factory _$$TransferImplCopyWith(
          _$TransferImpl value, $Res Function(_$TransferImpl) then) =
      __$$TransferImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      double amount,
      TransferType transferType,
      PaymentType paymentType,
      String transferCode,
      String referenceCode,
      DateTime transferDate});
}

/// @nodoc
class __$$TransferImplCopyWithImpl<$Res>
    extends _$TransferCopyWithImpl<$Res, _$TransferImpl>
    implements _$$TransferImplCopyWith<$Res> {
  __$$TransferImplCopyWithImpl(
      _$TransferImpl _value, $Res Function(_$TransferImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? amount = null,
    Object? transferType = null,
    Object? paymentType = null,
    Object? transferCode = null,
    Object? referenceCode = null,
    Object? transferDate = null,
  }) {
    return _then(_$TransferImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      transferType: null == transferType
          ? _value.transferType
          : transferType // ignore: cast_nullable_to_non_nullable
              as TransferType,
      paymentType: null == paymentType
          ? _value.paymentType
          : paymentType // ignore: cast_nullable_to_non_nullable
              as PaymentType,
      transferCode: null == transferCode
          ? _value.transferCode
          : transferCode // ignore: cast_nullable_to_non_nullable
              as String,
      referenceCode: null == referenceCode
          ? _value.referenceCode
          : referenceCode // ignore: cast_nullable_to_non_nullable
              as String,
      transferDate: null == transferDate
          ? _value.transferDate
          : transferDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TransferImpl implements _Transfer {
  const _$TransferImpl(
      {this.id,
      required this.amount,
      required this.transferType,
      required this.paymentType,
      required this.transferCode,
      required this.referenceCode,
      required this.transferDate});

  factory _$TransferImpl.fromJson(Map<String, dynamic> json) =>
      _$$TransferImplFromJson(json);

  @override
  final int? id;
  @override
  final double amount;
  @override
  final TransferType transferType;
  @override
  final PaymentType paymentType;
  @override
  final String transferCode;
  @override
  final String referenceCode;
  @override
  final DateTime transferDate;

  @override
  String toString() {
    return 'Transfer(id: $id, amount: $amount, transferType: $transferType, paymentType: $paymentType, transferCode: $transferCode, referenceCode: $referenceCode, transferDate: $transferDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransferImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.transferType, transferType) ||
                other.transferType == transferType) &&
            (identical(other.paymentType, paymentType) ||
                other.paymentType == paymentType) &&
            (identical(other.transferCode, transferCode) ||
                other.transferCode == transferCode) &&
            (identical(other.referenceCode, referenceCode) ||
                other.referenceCode == referenceCode) &&
            (identical(other.transferDate, transferDate) ||
                other.transferDate == transferDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, amount, transferType,
      paymentType, transferCode, referenceCode, transferDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TransferImplCopyWith<_$TransferImpl> get copyWith =>
      __$$TransferImplCopyWithImpl<_$TransferImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TransferImplToJson(
      this,
    );
  }
}

abstract class _Transfer implements Transfer {
  const factory _Transfer(
      {final int? id,
      required final double amount,
      required final TransferType transferType,
      required final PaymentType paymentType,
      required final String transferCode,
      required final String referenceCode,
      required final DateTime transferDate}) = _$TransferImpl;

  factory _Transfer.fromJson(Map<String, dynamic> json) =
      _$TransferImpl.fromJson;

  @override
  int? get id;
  @override
  double get amount;
  @override
  TransferType get transferType;
  @override
  PaymentType get paymentType;
  @override
  String get transferCode;
  @override
  String get referenceCode;
  @override
  DateTime get transferDate;
  @override
  @JsonKey(ignore: true)
  _$$TransferImplCopyWith<_$TransferImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
