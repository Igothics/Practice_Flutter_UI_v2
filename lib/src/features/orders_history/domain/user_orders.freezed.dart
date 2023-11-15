// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_orders.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserOrder _$UserOrderFromJson(Map<String, dynamic> json) {
  return _UserOrder.fromJson(json);
}

/// @nodoc
mixin _$UserOrder {
  int get id => throw _privateConstructorUsedError;
  List<Order> get orders => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserOrderCopyWith<UserOrder> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserOrderCopyWith<$Res> {
  factory $UserOrderCopyWith(UserOrder value, $Res Function(UserOrder) then) =
      _$UserOrderCopyWithImpl<$Res, UserOrder>;
  @useResult
  $Res call({int id, List<Order> orders});
}

/// @nodoc
class _$UserOrderCopyWithImpl<$Res, $Val extends UserOrder>
    implements $UserOrderCopyWith<$Res> {
  _$UserOrderCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? orders = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      orders: null == orders
          ? _value.orders
          : orders // ignore: cast_nullable_to_non_nullable
              as List<Order>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserOrderImplCopyWith<$Res>
    implements $UserOrderCopyWith<$Res> {
  factory _$$UserOrderImplCopyWith(
          _$UserOrderImpl value, $Res Function(_$UserOrderImpl) then) =
      __$$UserOrderImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, List<Order> orders});
}

/// @nodoc
class __$$UserOrderImplCopyWithImpl<$Res>
    extends _$UserOrderCopyWithImpl<$Res, _$UserOrderImpl>
    implements _$$UserOrderImplCopyWith<$Res> {
  __$$UserOrderImplCopyWithImpl(
      _$UserOrderImpl _value, $Res Function(_$UserOrderImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? orders = null,
  }) {
    return _then(_$UserOrderImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      orders: null == orders
          ? _value._orders
          : orders // ignore: cast_nullable_to_non_nullable
              as List<Order>,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$UserOrderImpl with DiagnosticableTreeMixin implements _UserOrder {
  const _$UserOrderImpl({required this.id, required final List<Order> orders})
      : _orders = orders;

  factory _$UserOrderImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserOrderImplFromJson(json);

  @override
  final int id;
  final List<Order> _orders;
  @override
  List<Order> get orders {
    if (_orders is EqualUnmodifiableListView) return _orders;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_orders);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UserOrder(id: $id, orders: $orders)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'UserOrder'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('orders', orders));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserOrderImpl &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality().equals(other._orders, _orders));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, const DeepCollectionEquality().hash(_orders));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserOrderImplCopyWith<_$UserOrderImpl> get copyWith =>
      __$$UserOrderImplCopyWithImpl<_$UserOrderImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserOrderImplToJson(
      this,
    );
  }
}

abstract class _UserOrder implements UserOrder {
  const factory _UserOrder(
      {required final int id,
      required final List<Order> orders}) = _$UserOrderImpl;

  factory _UserOrder.fromJson(Map<String, dynamic> json) =
      _$UserOrderImpl.fromJson;

  @override
  int get id;
  @override
  List<Order> get orders;
  @override
  @JsonKey(ignore: true)
  _$$UserOrderImplCopyWith<_$UserOrderImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
