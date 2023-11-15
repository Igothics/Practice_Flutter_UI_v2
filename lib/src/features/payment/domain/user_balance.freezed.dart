// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_balance.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserBalance _$UserBalanceFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'default':
      return _UserBalance.fromJson(json);
    case 'zero':
      return _UserBalanceZero.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'UserBalance',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$UserBalance {
  int get id => throw _privateConstructorUsedError;
  double get balance => throw _privateConstructorUsedError;
  DateTime? get createAt => throw _privateConstructorUsedError;
  DateTime? get updateAt => throw _privateConstructorUsedError;
  List<Transfer> get transferLog => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(int id, double balance, DateTime? createAt,
            DateTime? updateAt, List<Transfer> transferLog)
        $default, {
    required TResult Function(int id, double balance, DateTime? createAt,
            DateTime? updateAt, List<Transfer> transferLog)
        zero,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(int id, double balance, DateTime? createAt,
            DateTime? updateAt, List<Transfer> transferLog)?
        $default, {
    TResult? Function(int id, double balance, DateTime? createAt,
            DateTime? updateAt, List<Transfer> transferLog)?
        zero,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(int id, double balance, DateTime? createAt,
            DateTime? updateAt, List<Transfer> transferLog)?
        $default, {
    TResult Function(int id, double balance, DateTime? createAt,
            DateTime? updateAt, List<Transfer> transferLog)?
        zero,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_UserBalance value) $default, {
    required TResult Function(_UserBalanceZero value) zero,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_UserBalance value)? $default, {
    TResult? Function(_UserBalanceZero value)? zero,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_UserBalance value)? $default, {
    TResult Function(_UserBalanceZero value)? zero,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserBalanceCopyWith<UserBalance> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserBalanceCopyWith<$Res> {
  factory $UserBalanceCopyWith(
          UserBalance value, $Res Function(UserBalance) then) =
      _$UserBalanceCopyWithImpl<$Res, UserBalance>;
  @useResult
  $Res call(
      {int id,
      double balance,
      DateTime? createAt,
      DateTime? updateAt,
      List<Transfer> transferLog});
}

/// @nodoc
class _$UserBalanceCopyWithImpl<$Res, $Val extends UserBalance>
    implements $UserBalanceCopyWith<$Res> {
  _$UserBalanceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? balance = null,
    Object? createAt = freezed,
    Object? updateAt = freezed,
    Object? transferLog = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      balance: null == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as double,
      createAt: freezed == createAt
          ? _value.createAt
          : createAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updateAt: freezed == updateAt
          ? _value.updateAt
          : updateAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      transferLog: null == transferLog
          ? _value.transferLog
          : transferLog // ignore: cast_nullable_to_non_nullable
              as List<Transfer>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserBalanceImplCopyWith<$Res>
    implements $UserBalanceCopyWith<$Res> {
  factory _$$UserBalanceImplCopyWith(
          _$UserBalanceImpl value, $Res Function(_$UserBalanceImpl) then) =
      __$$UserBalanceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      double balance,
      DateTime? createAt,
      DateTime? updateAt,
      List<Transfer> transferLog});
}

/// @nodoc
class __$$UserBalanceImplCopyWithImpl<$Res>
    extends _$UserBalanceCopyWithImpl<$Res, _$UserBalanceImpl>
    implements _$$UserBalanceImplCopyWith<$Res> {
  __$$UserBalanceImplCopyWithImpl(
      _$UserBalanceImpl _value, $Res Function(_$UserBalanceImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? balance = null,
    Object? createAt = freezed,
    Object? updateAt = freezed,
    Object? transferLog = null,
  }) {
    return _then(_$UserBalanceImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      balance: null == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as double,
      createAt: freezed == createAt
          ? _value.createAt
          : createAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updateAt: freezed == updateAt
          ? _value.updateAt
          : updateAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      transferLog: null == transferLog
          ? _value._transferLog
          : transferLog // ignore: cast_nullable_to_non_nullable
              as List<Transfer>,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$UserBalanceImpl with DiagnosticableTreeMixin implements _UserBalance {
  const _$UserBalanceImpl(
      {required this.id,
      required this.balance,
      required this.createAt,
      required this.updateAt,
      required final List<Transfer> transferLog,
      final String? $type})
      : _transferLog = transferLog,
        $type = $type ?? 'default';

  factory _$UserBalanceImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserBalanceImplFromJson(json);

  @override
  final int id;
  @override
  final double balance;
  @override
  final DateTime? createAt;
  @override
  final DateTime? updateAt;
  final List<Transfer> _transferLog;
  @override
  List<Transfer> get transferLog {
    if (_transferLog is EqualUnmodifiableListView) return _transferLog;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_transferLog);
  }

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UserBalance(id: $id, balance: $balance, createAt: $createAt, updateAt: $updateAt, transferLog: $transferLog)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'UserBalance'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('balance', balance))
      ..add(DiagnosticsProperty('createAt', createAt))
      ..add(DiagnosticsProperty('updateAt', updateAt))
      ..add(DiagnosticsProperty('transferLog', transferLog));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserBalanceImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.balance, balance) || other.balance == balance) &&
            (identical(other.createAt, createAt) ||
                other.createAt == createAt) &&
            (identical(other.updateAt, updateAt) ||
                other.updateAt == updateAt) &&
            const DeepCollectionEquality()
                .equals(other._transferLog, _transferLog));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, balance, createAt, updateAt,
      const DeepCollectionEquality().hash(_transferLog));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserBalanceImplCopyWith<_$UserBalanceImpl> get copyWith =>
      __$$UserBalanceImplCopyWithImpl<_$UserBalanceImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(int id, double balance, DateTime? createAt,
            DateTime? updateAt, List<Transfer> transferLog)
        $default, {
    required TResult Function(int id, double balance, DateTime? createAt,
            DateTime? updateAt, List<Transfer> transferLog)
        zero,
  }) {
    return $default(id, balance, createAt, updateAt, transferLog);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(int id, double balance, DateTime? createAt,
            DateTime? updateAt, List<Transfer> transferLog)?
        $default, {
    TResult? Function(int id, double balance, DateTime? createAt,
            DateTime? updateAt, List<Transfer> transferLog)?
        zero,
  }) {
    return $default?.call(id, balance, createAt, updateAt, transferLog);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(int id, double balance, DateTime? createAt,
            DateTime? updateAt, List<Transfer> transferLog)?
        $default, {
    TResult Function(int id, double balance, DateTime? createAt,
            DateTime? updateAt, List<Transfer> transferLog)?
        zero,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(id, balance, createAt, updateAt, transferLog);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_UserBalance value) $default, {
    required TResult Function(_UserBalanceZero value) zero,
  }) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_UserBalance value)? $default, {
    TResult? Function(_UserBalanceZero value)? zero,
  }) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_UserBalance value)? $default, {
    TResult Function(_UserBalanceZero value)? zero,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$UserBalanceImplToJson(
      this,
    );
  }
}

abstract class _UserBalance implements UserBalance {
  const factory _UserBalance(
      {required final int id,
      required final double balance,
      required final DateTime? createAt,
      required final DateTime? updateAt,
      required final List<Transfer> transferLog}) = _$UserBalanceImpl;

  factory _UserBalance.fromJson(Map<String, dynamic> json) =
      _$UserBalanceImpl.fromJson;

  @override
  int get id;
  @override
  double get balance;
  @override
  DateTime? get createAt;
  @override
  DateTime? get updateAt;
  @override
  List<Transfer> get transferLog;
  @override
  @JsonKey(ignore: true)
  _$$UserBalanceImplCopyWith<_$UserBalanceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UserBalanceZeroImplCopyWith<$Res>
    implements $UserBalanceCopyWith<$Res> {
  factory _$$UserBalanceZeroImplCopyWith(_$UserBalanceZeroImpl value,
          $Res Function(_$UserBalanceZeroImpl) then) =
      __$$UserBalanceZeroImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      double balance,
      DateTime? createAt,
      DateTime? updateAt,
      List<Transfer> transferLog});
}

/// @nodoc
class __$$UserBalanceZeroImplCopyWithImpl<$Res>
    extends _$UserBalanceCopyWithImpl<$Res, _$UserBalanceZeroImpl>
    implements _$$UserBalanceZeroImplCopyWith<$Res> {
  __$$UserBalanceZeroImplCopyWithImpl(
      _$UserBalanceZeroImpl _value, $Res Function(_$UserBalanceZeroImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? balance = null,
    Object? createAt = freezed,
    Object? updateAt = freezed,
    Object? transferLog = null,
  }) {
    return _then(_$UserBalanceZeroImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      balance: null == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as double,
      createAt: freezed == createAt
          ? _value.createAt
          : createAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updateAt: freezed == updateAt
          ? _value.updateAt
          : updateAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      transferLog: null == transferLog
          ? _value._transferLog
          : transferLog // ignore: cast_nullable_to_non_nullable
              as List<Transfer>,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$UserBalanceZeroImpl
    with DiagnosticableTreeMixin
    implements _UserBalanceZero {
  const _$UserBalanceZeroImpl(
      {this.id = 0,
      this.balance = 0.0,
      this.createAt = null,
      this.updateAt = null,
      final List<Transfer> transferLog = const [],
      final String? $type})
      : _transferLog = transferLog,
        $type = $type ?? 'zero';

  factory _$UserBalanceZeroImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserBalanceZeroImplFromJson(json);

  @override
  @JsonKey()
  final int id;
  @override
  @JsonKey()
  final double balance;
  @override
  @JsonKey()
  final DateTime? createAt;
  @override
  @JsonKey()
  final DateTime? updateAt;
  final List<Transfer> _transferLog;
  @override
  @JsonKey()
  List<Transfer> get transferLog {
    if (_transferLog is EqualUnmodifiableListView) return _transferLog;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_transferLog);
  }

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UserBalance.zero(id: $id, balance: $balance, createAt: $createAt, updateAt: $updateAt, transferLog: $transferLog)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'UserBalance.zero'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('balance', balance))
      ..add(DiagnosticsProperty('createAt', createAt))
      ..add(DiagnosticsProperty('updateAt', updateAt))
      ..add(DiagnosticsProperty('transferLog', transferLog));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserBalanceZeroImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.balance, balance) || other.balance == balance) &&
            (identical(other.createAt, createAt) ||
                other.createAt == createAt) &&
            (identical(other.updateAt, updateAt) ||
                other.updateAt == updateAt) &&
            const DeepCollectionEquality()
                .equals(other._transferLog, _transferLog));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, balance, createAt, updateAt,
      const DeepCollectionEquality().hash(_transferLog));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserBalanceZeroImplCopyWith<_$UserBalanceZeroImpl> get copyWith =>
      __$$UserBalanceZeroImplCopyWithImpl<_$UserBalanceZeroImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(int id, double balance, DateTime? createAt,
            DateTime? updateAt, List<Transfer> transferLog)
        $default, {
    required TResult Function(int id, double balance, DateTime? createAt,
            DateTime? updateAt, List<Transfer> transferLog)
        zero,
  }) {
    return zero(id, balance, createAt, updateAt, transferLog);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(int id, double balance, DateTime? createAt,
            DateTime? updateAt, List<Transfer> transferLog)?
        $default, {
    TResult? Function(int id, double balance, DateTime? createAt,
            DateTime? updateAt, List<Transfer> transferLog)?
        zero,
  }) {
    return zero?.call(id, balance, createAt, updateAt, transferLog);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(int id, double balance, DateTime? createAt,
            DateTime? updateAt, List<Transfer> transferLog)?
        $default, {
    TResult Function(int id, double balance, DateTime? createAt,
            DateTime? updateAt, List<Transfer> transferLog)?
        zero,
    required TResult orElse(),
  }) {
    if (zero != null) {
      return zero(id, balance, createAt, updateAt, transferLog);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_UserBalance value) $default, {
    required TResult Function(_UserBalanceZero value) zero,
  }) {
    return zero(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_UserBalance value)? $default, {
    TResult? Function(_UserBalanceZero value)? zero,
  }) {
    return zero?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_UserBalance value)? $default, {
    TResult Function(_UserBalanceZero value)? zero,
    required TResult orElse(),
  }) {
    if (zero != null) {
      return zero(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$UserBalanceZeroImplToJson(
      this,
    );
  }
}

abstract class _UserBalanceZero implements UserBalance {
  const factory _UserBalanceZero(
      {final int id,
      final double balance,
      final DateTime? createAt,
      final DateTime? updateAt,
      final List<Transfer> transferLog}) = _$UserBalanceZeroImpl;

  factory _UserBalanceZero.fromJson(Map<String, dynamic> json) =
      _$UserBalanceZeroImpl.fromJson;

  @override
  int get id;
  @override
  double get balance;
  @override
  DateTime? get createAt;
  @override
  DateTime? get updateAt;
  @override
  List<Transfer> get transferLog;
  @override
  @JsonKey(ignore: true)
  _$$UserBalanceZeroImplCopyWith<_$UserBalanceZeroImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
