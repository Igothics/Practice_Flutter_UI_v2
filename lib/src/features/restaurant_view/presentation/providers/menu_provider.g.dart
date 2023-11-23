// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$menuHash() => r'fbe4bbd80ce4c776b8f2fdd543b69c15e2a9c011';

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

/// See also [menu].
@ProviderFor(menu)
const menuProvider = MenuFamily();

/// See also [menu].
class MenuFamily extends Family<AsyncValue<Menu>> {
  /// See also [menu].
  const MenuFamily();

  /// See also [menu].
  MenuProvider call(
    String key,
  ) {
    return MenuProvider(
      key,
    );
  }

  @visibleForOverriding
  @override
  MenuProvider getProviderOverride(
    covariant MenuProvider provider,
  ) {
    return call(
      provider.key,
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
  String? get name => r'menuProvider';
}

/// See also [menu].
class MenuProvider extends AutoDisposeFutureProvider<Menu> {
  /// See also [menu].
  MenuProvider(
    String key,
  ) : this._internal(
          (ref) => menu(
            ref as MenuRef,
            key,
          ),
          from: menuProvider,
          name: r'menuProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product') ? null : _$menuHash,
          dependencies: MenuFamily._dependencies,
          allTransitiveDependencies: MenuFamily._allTransitiveDependencies,
          key: key,
        );

  MenuProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.key,
  }) : super.internal();

  final String key;

  @override
  Override overrideWith(
    FutureOr<Menu> Function(MenuRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: MenuProvider._internal(
        (ref) => create(ref as MenuRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        key: key,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Menu> createElement() {
    return _MenuProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is MenuProvider && other.key == key;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, key.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin MenuRef on AutoDisposeFutureProviderRef<Menu> {
  /// The parameter `key` of this provider.
  String get key;
}

class _MenuProviderElement extends AutoDisposeFutureProviderElement<Menu>
    with MenuRef {
  _MenuProviderElement(super.provider);

  @override
  String get key => (origin as MenuProvider).key;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, inference_failure_on_uninitialized_variable, inference_failure_on_function_return_type, inference_failure_on_untyped_parameter
