// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$cartHash() => r'830363b867c72a4abeb2be837ce6e9ecb2a35c77';

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

abstract class _$Cart extends BuildlessNotifier<List<Item>> {
  late final int? uid;

  List<Item> build(
    int? uid,
  );
}

/// See also [Cart].
@ProviderFor(Cart)
const cartProvider = CartFamily();

/// See also [Cart].
class CartFamily extends Family<List<Item>> {
  /// See also [Cart].
  const CartFamily();

  /// See also [Cart].
  CartProvider call(
    int? uid,
  ) {
    return CartProvider(
      uid,
    );
  }

  @visibleForOverriding
  @override
  CartProvider getProviderOverride(
    covariant CartProvider provider,
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
  String? get name => r'cartProvider';
}

/// See also [Cart].
class CartProvider extends NotifierProviderImpl<Cart, List<Item>> {
  /// See also [Cart].
  CartProvider(
    int? uid,
  ) : this._internal(
          () => Cart()..uid = uid,
          from: cartProvider,
          name: r'cartProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product') ? null : _$cartHash,
          dependencies: CartFamily._dependencies,
          allTransitiveDependencies: CartFamily._allTransitiveDependencies,
          uid: uid,
        );

  CartProvider._internal(
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
    covariant Cart notifier,
  ) {
    return notifier.build(
      uid,
    );
  }

  @override
  Override overrideWith(Cart Function() create) {
    return ProviderOverride(
      origin: this,
      override: CartProvider._internal(
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
  NotifierProviderElement<Cart, List<Item>> createElement() {
    return _CartProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CartProvider && other.uid == uid;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, uid.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin CartRef on NotifierProviderRef<List<Item>> {
  /// The parameter `uid` of this provider.
  int? get uid;
}

class _CartProviderElement extends NotifierProviderElement<Cart, List<Item>>
    with CartRef {
  _CartProviderElement(super.provider);

  @override
  int? get uid => (origin as CartProvider).uid;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, inference_failure_on_uninitialized_variable, inference_failure_on_function_return_type, inference_failure_on_untyped_parameter
