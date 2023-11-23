// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_service_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$cartServiceHash() => r'9f55b3941cef3f428edf89c7dc71165db1640223';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$CartService extends BuildlessNotifier<List<Item>> {
  late final int? uid;

  List<Item> build(
    int? uid,
  );
}

/// See also [CartService].
@ProviderFor(CartService)
const cartServiceProvider = CartServiceFamily();

/// See also [CartService].
class CartServiceFamily extends Family<List<Item>> {
  /// See also [CartService].
  const CartServiceFamily();

  /// See also [CartService].
  CartServiceProvider call(
    int? uid,
  ) {
    return CartServiceProvider(
      uid,
    );
  }

  @visibleForOverriding
  @override
  CartServiceProvider getProviderOverride(
    covariant CartServiceProvider provider,
  ) {
    return call(
      provider.uid,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'cartServiceProvider';
}

/// See also [CartService].
class CartServiceProvider
    extends NotifierProviderImpl<CartService, List<Item>> {
  /// See also [CartService].
  CartServiceProvider(
    int? uid,
  ) : this._internal(
          () => CartService()..uid = uid,
          from: cartServiceProvider,
          name: r'cartServiceProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$cartServiceHash,
          dependencies: CartServiceFamily._dependencies,
          allTransitiveDependencies:
              CartServiceFamily._allTransitiveDependencies,
          uid: uid,
        );

  CartServiceProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.uid,
  }) : super.internal();

  final int? uid;

  @override
  List<Item> runNotifierBuild(
    covariant CartService notifier,
  ) {
    return notifier.build(
      uid,
    );
  }

  @override
  Override overrideWith(CartService Function() create) {
    return ProviderOverride(
      origin: this,
      override: CartServiceProvider._internal(
        () => create()..uid = uid,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        uid: uid,
      ),
    );
  }

  @override
  NotifierProviderElement<CartService, List<Item>> createElement() {
    return _CartServiceProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CartServiceProvider && other.uid == uid;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, uid.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin CartServiceRef on NotifierProviderRef<List<Item>> {
  /// The parameter `uid` of this provider.
  int? get uid;
}

class _CartServiceProviderElement
    extends NotifierProviderElement<CartService, List<Item>>
    with CartServiceRef {
  _CartServiceProviderElement(super.provider);

  @override
  int? get uid => (origin as CartServiceProvider).uid;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, inference_failure_on_uninitialized_variable, inference_failure_on_function_return_type, inference_failure_on_untyped_parameter
