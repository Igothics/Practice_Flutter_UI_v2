// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_order_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$userOrdersHash() => r'fadceab88efa2a1b4c6046c3cb278d2c41ae5814';

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

/// See also [userOrders].
@ProviderFor(userOrders)
const userOrdersProvider = UserOrdersFamily();

/// See also [userOrders].
class UserOrdersFamily extends Family<AsyncValue<UserOrders>> {
  /// See also [userOrders].
  const UserOrdersFamily();

  /// See also [userOrders].
  UserOrdersProvider call(
    String id,
  ) {
    return UserOrdersProvider(
      id,
    );
  }

  @override
  UserOrdersProvider getProviderOverride(
    covariant UserOrdersProvider provider,
  ) {
    return call(
      provider.id,
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
  String? get name => r'userOrdersProvider';
}

/// See also [userOrders].
class UserOrdersProvider extends AutoDisposeStreamProvider<UserOrders> {
  /// See also [userOrders].
  UserOrdersProvider(
    String id,
  ) : this._internal(
          (ref) => userOrders(
            ref as UserOrdersRef,
            id,
          ),
          from: userOrdersProvider,
          name: r'userOrdersProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$userOrdersHash,
          dependencies: UserOrdersFamily._dependencies,
          allTransitiveDependencies:
              UserOrdersFamily._allTransitiveDependencies,
          id: id,
        );

  UserOrdersProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final String id;

  @override
  Override overrideWith(
    Stream<UserOrders> Function(UserOrdersRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: UserOrdersProvider._internal(
        (ref) => create(ref as UserOrdersRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<UserOrders> createElement() {
    return _UserOrdersProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UserOrdersProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin UserOrdersRef on AutoDisposeStreamProviderRef<UserOrders> {
  /// The parameter `id` of this provider.
  String get id;
}

class _UserOrdersProviderElement
    extends AutoDisposeStreamProviderElement<UserOrders> with UserOrdersRef {
  _UserOrdersProviderElement(super.provider);

  @override
  String get id => (origin as UserOrdersProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
