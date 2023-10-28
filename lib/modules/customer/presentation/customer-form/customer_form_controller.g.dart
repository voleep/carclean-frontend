// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_form_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$customerFormControllerHash() =>
    r'a997c6b760dd079ec03e5fc3e5ca50f190d7622e';

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

abstract class _$CustomerFormController
    extends BuildlessAutoDisposeAsyncNotifier<CustomerModel?> {
  late final String? arg;
  late final FormMode mode;

  FutureOr<CustomerModel?> build(
    String? arg,
    FormMode mode,
  );
}

/// See also [CustomerFormController].
@ProviderFor(CustomerFormController)
const customerFormControllerProvider = CustomerFormControllerFamily();

/// See also [CustomerFormController].
class CustomerFormControllerFamily extends Family<AsyncValue<CustomerModel?>> {
  /// See also [CustomerFormController].
  const CustomerFormControllerFamily();

  /// See also [CustomerFormController].
  CustomerFormControllerProvider call(
    String? arg,
    FormMode mode,
  ) {
    return CustomerFormControllerProvider(
      arg,
      mode,
    );
  }

  @override
  CustomerFormControllerProvider getProviderOverride(
    covariant CustomerFormControllerProvider provider,
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
  String? get name => r'customerFormControllerProvider';
}

/// See also [CustomerFormController].
class CustomerFormControllerProvider
    extends AutoDisposeAsyncNotifierProviderImpl<CustomerFormController,
        CustomerModel?> {
  /// See also [CustomerFormController].
  CustomerFormControllerProvider(
    this.arg,
    this.mode,
  ) : super.internal(
          () => CustomerFormController()
            ..arg = arg
            ..mode = mode,
          from: customerFormControllerProvider,
          name: r'customerFormControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$customerFormControllerHash,
          dependencies: CustomerFormControllerFamily._dependencies,
          allTransitiveDependencies:
              CustomerFormControllerFamily._allTransitiveDependencies,
        );

  final String? arg;
  final FormMode mode;

  @override
  bool operator ==(Object other) {
    return other is CustomerFormControllerProvider &&
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
  FutureOr<CustomerModel?> runNotifierBuild(
    covariant CustomerFormController notifier,
  ) {
    return notifier.build(
      arg,
      mode,
    );
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
