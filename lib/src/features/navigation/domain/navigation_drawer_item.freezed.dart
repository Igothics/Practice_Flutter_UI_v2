// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'navigation_drawer_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$NavigationDrawerItem {
  int get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get location => throw _privateConstructorUsedError;
  NavigationDrawerDestination get destination =>
      throw _privateConstructorUsedError;
  VoidCallback? get onEnter => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NavigationDrawerItemCopyWith<NavigationDrawerItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NavigationDrawerItemCopyWith<$Res> {
  factory $NavigationDrawerItemCopyWith(NavigationDrawerItem value,
          $Res Function(NavigationDrawerItem) then) =
      _$NavigationDrawerItemCopyWithImpl<$Res, NavigationDrawerItem>;
  @useResult
  $Res call(
      {int id,
      String title,
      String location,
      NavigationDrawerDestination destination,
      VoidCallback? onEnter});
}

/// @nodoc
class _$NavigationDrawerItemCopyWithImpl<$Res,
        $Val extends NavigationDrawerItem>
    implements $NavigationDrawerItemCopyWith<$Res> {
  _$NavigationDrawerItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? location = null,
    Object? destination = null,
    Object? onEnter = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      destination: null == destination
          ? _value.destination
          : destination // ignore: cast_nullable_to_non_nullable
              as NavigationDrawerDestination,
      onEnter: freezed == onEnter
          ? _value.onEnter
          : onEnter // ignore: cast_nullable_to_non_nullable
              as VoidCallback?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NavigationDrawerItemImplCopyWith<$Res>
    implements $NavigationDrawerItemCopyWith<$Res> {
  factory _$$NavigationDrawerItemImplCopyWith(_$NavigationDrawerItemImpl value,
          $Res Function(_$NavigationDrawerItemImpl) then) =
      __$$NavigationDrawerItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String title,
      String location,
      NavigationDrawerDestination destination,
      VoidCallback? onEnter});
}

/// @nodoc
class __$$NavigationDrawerItemImplCopyWithImpl<$Res>
    extends _$NavigationDrawerItemCopyWithImpl<$Res, _$NavigationDrawerItemImpl>
    implements _$$NavigationDrawerItemImplCopyWith<$Res> {
  __$$NavigationDrawerItemImplCopyWithImpl(_$NavigationDrawerItemImpl _value,
      $Res Function(_$NavigationDrawerItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? location = null,
    Object? destination = null,
    Object? onEnter = freezed,
  }) {
    return _then(_$NavigationDrawerItemImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      destination: null == destination
          ? _value.destination
          : destination // ignore: cast_nullable_to_non_nullable
              as NavigationDrawerDestination,
      onEnter: freezed == onEnter
          ? _value.onEnter
          : onEnter // ignore: cast_nullable_to_non_nullable
              as VoidCallback?,
    ));
  }
}

/// @nodoc

class _$NavigationDrawerItemImpl
    with DiagnosticableTreeMixin
    implements _NavigationDrawerItem {
  const _$NavigationDrawerItemImpl(
      {this.id = 0,
      required this.title,
      required this.location,
      required this.destination,
      this.onEnter});

  @override
  @JsonKey()
  final int id;
  @override
  final String title;
  @override
  final String location;
  @override
  final NavigationDrawerDestination destination;
  @override
  final VoidCallback? onEnter;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'NavigationDrawerItem(id: $id, title: $title, location: $location, destination: $destination, onEnter: $onEnter)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'NavigationDrawerItem'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('location', location))
      ..add(DiagnosticsProperty('destination', destination))
      ..add(DiagnosticsProperty('onEnter', onEnter));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NavigationDrawerItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.destination, destination) ||
                other.destination == destination) &&
            (identical(other.onEnter, onEnter) || other.onEnter == onEnter));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, title, location, destination, onEnter);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NavigationDrawerItemImplCopyWith<_$NavigationDrawerItemImpl>
      get copyWith =>
          __$$NavigationDrawerItemImplCopyWithImpl<_$NavigationDrawerItemImpl>(
              this, _$identity);
}

abstract class _NavigationDrawerItem implements NavigationDrawerItem {
  const factory _NavigationDrawerItem(
      {final int id,
      required final String title,
      required final String location,
      required final NavigationDrawerDestination destination,
      final VoidCallback? onEnter}) = _$NavigationDrawerItemImpl;

  @override
  int get id;
  @override
  String get title;
  @override
  String get location;
  @override
  NavigationDrawerDestination get destination;
  @override
  VoidCallback? get onEnter;
  @override
  @JsonKey(ignore: true)
  _$$NavigationDrawerItemImplCopyWith<_$NavigationDrawerItemImpl>
      get copyWith => throw _privateConstructorUsedError;
}
