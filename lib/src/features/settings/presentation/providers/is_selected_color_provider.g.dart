// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'is_selected_color_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$isSelectedColorHash() => r'4d42235c193e5bc38a94ae76220e1a2b18e6c81a';

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

/// See also [isSelectedColor].
@ProviderFor(isSelectedColor)
const isSelectedColorProvider = IsSelectedColorFamily();

/// See also [isSelectedColor].
class IsSelectedColorFamily extends Family<bool> {
  /// See also [isSelectedColor].
  const IsSelectedColorFamily();

  /// See also [isSelectedColor].
  IsSelectedColorProvider call(
    int? colorValue,
  ) {
    return IsSelectedColorProvider(
      colorValue,
    );
  }

  @visibleForOverriding
  @override
  IsSelectedColorProvider getProviderOverride(
    covariant IsSelectedColorProvider provider,
  ) {
    return call(
      provider.colorValue,
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
  String? get name => r'isSelectedColorProvider';
}

/// See also [isSelectedColor].
class IsSelectedColorProvider extends AutoDisposeProvider<bool> {
  /// See also [isSelectedColor].
  IsSelectedColorProvider(
    int? colorValue,
  ) : this._internal(
          (ref) => isSelectedColor(
            ref as IsSelectedColorRef,
            colorValue,
          ),
          from: isSelectedColorProvider,
          name: r'isSelectedColorProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$isSelectedColorHash,
          dependencies: IsSelectedColorFamily._dependencies,
          allTransitiveDependencies:
              IsSelectedColorFamily._allTransitiveDependencies,
          colorValue: colorValue,
        );

  IsSelectedColorProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.colorValue,
  }) : super.internal();

  final int? colorValue;

  @override
  Override overrideWith(
    bool Function(IsSelectedColorRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: IsSelectedColorProvider._internal(
        (ref) => create(ref as IsSelectedColorRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        colorValue: colorValue,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<bool> createElement() {
    return _IsSelectedColorProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is IsSelectedColorProvider && other.colorValue == colorValue;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, colorValue.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin IsSelectedColorRef on AutoDisposeProviderRef<bool> {
  /// The parameter `colorValue` of this provider.
  int? get colorValue;
}

class _IsSelectedColorProviderElement extends AutoDisposeProviderElement<bool>
    with IsSelectedColorRef {
  _IsSelectedColorProviderElement(super.provider);

  @override
  int? get colorValue => (origin as IsSelectedColorProvider).colorValue;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, inference_failure_on_uninitialized_variable, inference_failure_on_function_return_type, inference_failure_on_untyped_parameter
