// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_form_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$productFormControllerHash() =>
    r'af6ff7a46c1da3760409ad5d19d4f3d264945f48';

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

abstract class _$ProductFormController
    extends BuildlessAutoDisposeAsyncNotifier<ProductModel?> {
  late final String? arg;
  late final FormMode mode;

  FutureOr<ProductModel?> build(
    String? arg,
    FormMode mode,
  );
}

/// See also [ProductFormController].
@ProviderFor(ProductFormController)
const productFormControllerProvider = ProductFormControllerFamily();

/// See also [ProductFormController].
class ProductFormControllerFamily extends Family<AsyncValue<ProductModel?>> {
  /// See also [ProductFormController].
  const ProductFormControllerFamily();

  /// See also [ProductFormController].
  ProductFormControllerProvider call(
    String? arg,
    FormMode mode,
  ) {
    return ProductFormControllerProvider(
      arg,
      mode,
    );
  }

  @override
  ProductFormControllerProvider getProviderOverride(
    covariant ProductFormControllerProvider provider,
  ) {
    return call(
      provider.arg,
      provider.mode,
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
  String? get name => r'productFormControllerProvider';
}

/// See also [ProductFormController].
class ProductFormControllerProvider
    extends AutoDisposeAsyncNotifierProviderImpl<ProductFormController,
        ProductModel?> {
  /// See also [ProductFormController].
  ProductFormControllerProvider(
    this.arg,
    this.mode,
  ) : super.internal(
          () => ProductFormController()
            ..arg = arg
            ..mode = mode,
          from: productFormControllerProvider,
          name: r'productFormControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$productFormControllerHash,
          dependencies: ProductFormControllerFamily._dependencies,
          allTransitiveDependencies:
              ProductFormControllerFamily._allTransitiveDependencies,
        );

  final String? arg;
  final FormMode mode;

  @override
  bool operator ==(Object other) {
    return other is ProductFormControllerProvider &&
        other.arg == arg &&
        other.mode == mode;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, arg.hashCode);
    hash = _SystemHash.combine(hash, mode.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  FutureOr<ProductModel?> runNotifierBuild(
    covariant ProductFormController notifier,
  ) {
    return notifier.build(
      arg,
      mode,
    );
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
