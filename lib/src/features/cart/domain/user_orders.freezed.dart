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

UserOrders _$UserOrdersFromJson(Map<String, dynamic> json) {
  return _UserOrders.fromJson(json);
}

/// @nodoc
mixin _$UserOrders {
  String get id => throw _privateConstructorUsedError;
  List<Order> get orders => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserOrdersCopyWith<UserOrders> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserOrdersCopyWith<$Res> {
  factory $UserOrdersCopyWith(
          UserOrders value, $Res Function(UserOrders) then) =
      _$UserOrdersCopyWithImpl<$Res, UserOrders>;
  @useResult
  $Res call({String id, List<Order> orders});
}

/// @nodoc
class _$UserOrdersCopyWithImpl<$Res, $Val extends UserOrders>
    implements $UserOrdersCopyWith<$Res> {
  _$UserOrdersCopyWithImpl(this._value, this._then);

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
              as String,
      orders: null == orders
          ? _value.orders
          : orders // ignore: cast_nullable_to_non_nullable
              as List<Order>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserOrdersCopyWith<$Res>
    implements $UserOrdersCopyWith<$Res> {
  factory _$$_UserOrdersCopyWith(
          _$_UserOrders value, $Res Function(_$_UserOrders) then) =
      __$$_UserOrdersCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, List<Order> orders});
}

/// @nodoc
class __$$_UserOrdersCopyWithImpl<$Res>
    extends _$UserOrdersCopyWithImpl<$Res, _$_UserOrders>
    implements _$$_UserOrdersCopyWith<$Res> {
  __$$_UserOrdersCopyWithImpl(
      _$_UserOrders _value, $Res Function(_$_UserOrders) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? orders = null,
  }) {
    return _then(_$_UserOrders(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      orders: null == orders
          ? _value._orders
          : orders // ignore: cast_nullable_to_non_nullable
              as List<Order>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserOrders with DiagnosticableTreeMixin implements _UserOrders {
  const _$_UserOrders({required this.id, required final List<Order> orders})
      : _orders = orders;

  factory _$_UserOrders.fromJson(Map<String, dynamic> json) =>
      _$$_UserOrdersFromJson(json);

  @override
  final String id;
  final List<Order> _orders;
  @override
  List<Order> get orders {
    if (_orders is EqualUnmodifiableListView) return _orders;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_orders);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UserOrders(id: $id, orders: $orders)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'UserOrders'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('orders', orders));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserOrders &&
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
  _$$_UserOrdersCopyWith<_$_UserOrders> get copyWith =>
      __$$_UserOrdersCopyWithImpl<_$_UserOrders>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserOrdersToJson(
      this,
    );
  }
}

abstract class _UserOrders implements UserOrders {
  const factory _UserOrders(
      {required final String id,
      required final List<Order> orders}) = _$_UserOrders;

  factory _UserOrders.fromJson(Map<String, dynamic> json) =
      _$_UserOrders.fromJson;

  @override
  String get id;
  @override
  List<Order> get orders;
  @override
  @JsonKey(ignore: true)
  _$$_UserOrdersCopyWith<_$_UserOrders> get copyWith =>
      throw _privateConstructorUsedError;
}
