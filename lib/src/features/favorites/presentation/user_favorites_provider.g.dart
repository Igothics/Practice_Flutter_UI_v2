// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_favorites_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$userFavoritesHash() => r'fdbca2676019c1af2e09f24b9587920772ce6962';

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

/// See also [userFavorites].
@ProviderFor(userFavorites)
const userFavoritesProvider = UserFavoritesFamily();

/// See also [userFavorites].
class UserFavoritesFamily extends Family<AsyncValue<UserFavorites>> {
  /// See also [userFavorites].
  const UserFavoritesFamily();

  /// See also [userFavorites].
  UserFavoritesProvider call(
    String id,
  ) {
    return UserFavoritesProvider(
      id,
    );
  }

  @visibleForOverriding
  @override
  UserFavoritesProvider getProviderOverride(
    covariant UserFavoritesProvider provider,
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
  String? get name => r'userFavoritesProvider';
}

/// See also [userFavorites].
class UserFavoritesProvider extends AutoDisposeStreamProvider<UserFavorites> {
  /// See also [userFavorites].
  UserFavoritesProvider(
    String id,
  ) : this._internal(
          (ref) => userFavorites(
            ref as UserFavoritesRef,
            id,
          ),
          from: userFavoritesProvider,
          name: r'userFavoritesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$userFavoritesHash,
          dependencies: UserFavoritesFamily._dependencies,
          allTransitiveDependencies:
              UserFavoritesFamily._allTransitiveDependencies,
          id: id,
        );

  UserFavoritesProvider._internal(
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
    Stream<UserFavorites> Function(UserFavoritesRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: UserFavoritesProvider._internal(
        (ref) => create(ref as UserFavoritesRef),
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
  AutoDisposeStreamProviderElement<UserFavorites> createElement() {
    return _UserFavoritesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UserFavoritesProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin UserFavoritesRef on AutoDisposeStreamProviderRef<UserFavorites> {
  /// The parameter `id` of this provider.
  String get id;
}

class _UserFavoritesProviderElement
    extends AutoDisposeStreamProviderElement<UserFavorites>
    with UserFavoritesRef {
  _UserFavoritesProviderElement(super.provider);

  @override
  String get id => (origin as UserFavoritesProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, inference_failure_on_uninitialized_variable, inference_failure_on_function_return_type, inference_failure_on_untyped_parameter
