// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Order _$OrderFromJson(Map<String, dynamic> json) {
  return _Order.fromJson(json);
}

/// @nodoc
mixin _$Order {
  int? get id => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;
  String get restaurantName => throw _privateConstructorUsedError;
  double get distance => throw _privateConstructorUsedError;
  String get foodName => throw _privateConstructorUsedError;
  DateTime? get date => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrderCopyWith<Order> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderCopyWith<$Res> {
  factory $OrderCopyWith(Order value, $Res Function(Order) then) =
      _$OrderCopyWithImpl<$Res, Order>;
  @useResult
  $Res call(
      {int? id,
      String imageUrl,
      String restaurantName,
      double distance,
      String foodName,
      DateTime? date,
      int quantity,
      double price});
}

/// @nodoc
class _$OrderCopyWithImpl<$Res, $Val extends Order>
    implements $OrderCopyWith<$Res> {
  _$OrderCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? imageUrl = null,
    Object? restaurantName = null,
    Object? distance = null,
    Object? foodName = null,
    Object? date = freezed,
    Object? quantity = null,
    Object? price = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      restaurantName: null == restaurantName
          ? _value.restaurantName
          : restaurantName // ignore: cast_nullable_to_non_nullable
              as String,
      distance: null == distance
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as double,
      foodName: null == foodName
          ? _value.foodName
          : foodName // ignore: cast_nullable_to_non_nullable
              as String,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OrderImplCopyWith<$Res> implements $OrderCopyWith<$Res> {
  factory _$$OrderImplCopyWith(
          _$OrderImpl value, $Res Function(_$OrderImpl) then) =
      __$$OrderImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String imageUrl,
      String restaurantName,
      double distance,
      String foodName,
      DateTime? date,
      int quantity,
      double price});
}

/// @nodoc
class __$$OrderImplCopyWithImpl<$Res>
    extends _$OrderCopyWithImpl<$Res, _$OrderImpl>
    implements _$$OrderImplCopyWith<$Res> {
  __$$OrderImplCopyWithImpl(
      _$OrderImpl _value, $Res Function(_$OrderImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? imageUrl = null,
    Object? restaurantName = null,
    Object? distance = null,
    Object? foodName = null,
    Object? date = freezed,
    Object? quantity = null,
    Object? price = null,
  }) {
    return _then(_$OrderImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      restaurantName: null == restaurantName
          ? _value.restaurantName
          : restaurantName // ignore: cast_nullable_to_non_nullable
              as String,
      distance: null == distance
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as double,
      foodName: null == foodName
          ? _value.foodName
          : foodName // ignore: cast_nullable_to_non_nullable
              as String,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OrderImpl with DiagnosticableTreeMixin implements _Order {
  const _$OrderImpl(
      {this.id,
      required this.imageUrl,
      required this.restaurantName,
      required this.distance,
      required this.foodName,
      this.date,
      required this.quantity,
      required this.price});

  factory _$OrderImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderImplFromJson(json);

  @override
  final int? id;
  @override
  final String imageUrl;
  @override
  final String restaurantName;
  @override
  final double distance;
  @override
  final String foodName;
  @override
  final DateTime? date;
  @override
  final int quantity;
  @override
  final double price;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Order(id: $id, imageUrl: $imageUrl, restaurantName: $restaurantName, distance: $distance, foodName: $foodName, date: $date, quantity: $quantity, price: $price)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Order'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('imageUrl', imageUrl))
      ..add(DiagnosticsProperty('restaurantName', restaurantName))
      ..add(DiagnosticsProperty('distance', distance))
      ..add(DiagnosticsProperty('foodName', foodName))
      ..add(DiagnosticsProperty('date', date))
      ..add(DiagnosticsProperty('quantity', quantity))
      ..add(DiagnosticsProperty('price', price));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.restaurantName, restaurantName) ||
                other.restaurantName == restaurantName) &&
            (identical(other.distance, distance) ||
                other.distance == distance) &&
            (identical(other.foodName, foodName) ||
                other.foodName == foodName) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.price, price) || other.price == price));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, imageUrl, restaurantName,
      distance, foodName, date, quantity, price);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderImplCopyWith<_$OrderImpl> get copyWith =>
      __$$OrderImplCopyWithImpl<_$OrderImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderImplToJson(
      this,
    );
  }
}

abstract class _Order implements Order {
  const factory _Order(
      {final int? id,
      required final String imageUrl,
      required final String restaurantName,
      required final double distance,
      required final String foodName,
      final DateTime? date,
      required final int quantity,
      required final double price}) = _$OrderImpl;

  factory _Order.fromJson(Map<String, dynamic> json) = _$OrderImpl.fromJson;

  @override
  int? get id;
  @override
  String get imageUrl;
  @override
  String get restaurantName;
  @override
  double get distance;
  @override
  String get foodName;
  @override
  DateTime? get date;
  @override
  int get quantity;
  @override
  double get price;
  @override
  @JsonKey(ignore: true)
  _$$OrderImplCopyWith<_$OrderImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
