// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'single_restaurant_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$singleRestaurantHash() => r'5b558927479560614f0bad84d8b295b11612446a';

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

/// See also [singleRestaurant].
@ProviderFor(singleRestaurant)
const singleRestaurantProvider = SingleRestaurantFamily();

/// See also [singleRestaurant].
class SingleRestaurantFamily extends Family<Restaurant> {
  /// See also [singleRestaurant].
  const SingleRestaurantFamily();

  /// See also [singleRestaurant].
  SingleRestaurantProvider call(
    String id,
  ) {
    return SingleRestaurantProvider(
      id,
    );
  }

  @visibleForOverriding
  @override
  SingleRestaurantProvider getProviderOverride(
    covariant SingleRestaurantProvider provider,
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
  String? get name => r'singleRestaurantProvider';
}

/// See also [singleRestaurant].
class SingleRestaurantProvider extends Provider<Restaurant> {
  /// See also [singleRestaurant].
  SingleRestaurantProvider(
    String id,
  ) : this._internal(
          (ref) => singleRestaurant(
            ref as SingleRestaurantRef,
            id,
          ),
          from: singleRestaurantProvider,
          name: r'singleRestaurantProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$singleRestaurantHash,
          dependencies: SingleRestaurantFamily._dependencies,
          allTransitiveDependencies:
              SingleRestaurantFamily._allTransitiveDependencies,
          id: id,
        );

  SingleRestaurantProvider._internal(
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
    Restaurant Function(SingleRestaurantRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SingleRestaurantProvider._internal(
        (ref) => create(ref as SingleRestaurantRef),
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
  ProviderElement<Restaurant> createElement() {
    return _SingleRestaurantProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SingleRestaurantProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SingleRestaurantRef on ProviderRef<Restaurant> {
  /// The parameter `id` of this provider.
  String get id;
}

class _SingleRestaurantProviderElement extends ProviderElement<Restaurant>
    with SingleRestaurantRef {
  _SingleRestaurantProviderElement(super.provider);

  @override
  String get id => (origin as SingleRestaurantProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, inference_failure_on_uninitialized_variable, inference_failure_on_function_return_type, inference_failure_on_untyped_parameter
