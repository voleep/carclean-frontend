// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_order_form_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$serviceOrderFormControllerHash() =>
    r'6b579ca8b417c1d16636f8c1997192e3f00d57fe';

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

abstract class _$ServiceOrderFormController
    extends BuildlessAutoDisposeAsyncNotifier<ServiceOrderModel?> {
  late final String? arg;
  late final FormMode mode;

  FutureOr<ServiceOrderModel?> build(
    String? arg,
    FormMode mode,
  );
}

/// See also [ServiceOrderFormController].
@ProviderFor(ServiceOrderFormController)
const serviceOrderFormControllerProvider = ServiceOrderFormControllerFamily();

/// See also [ServiceOrderFormController].
class ServiceOrderFormControllerFamily
    extends Family<AsyncValue<ServiceOrderModel?>> {
  /// See also [ServiceOrderFormController].
  const ServiceOrderFormControllerFamily();

  /// See also [ServiceOrderFormController].
  ServiceOrderFormControllerProvider call(
    String? arg,
    FormMode mode,
  ) {
    return ServiceOrderFormControllerProvider(
      arg,
      mode,
    );
  }

  @override
  ServiceOrderFormControllerProvider getProviderOverride(
    covariant ServiceOrderFormControllerProvider provider,
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
  String? get name => r'serviceOrderFormControllerProvider';
}

/// See also [ServiceOrderFormController].
class ServiceOrderFormControllerProvider
    extends AutoDisposeAsyncNotifierProviderImpl<ServiceOrderFormController,
        ServiceOrderModel?> {
  /// See also [ServiceOrderFormController].
  ServiceOrderFormControllerProvider(
    this.arg,
    this.mode,
  ) : super.internal(
          () => ServiceOrderFormController()
            ..arg = arg
            ..mode = mode,
          from: serviceOrderFormControllerProvider,
          name: r'serviceOrderFormControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$serviceOrderFormControllerHash,
          dependencies: ServiceOrderFormControllerFamily._dependencies,
          allTransitiveDependencies:
              ServiceOrderFormControllerFamily._allTransitiveDependencies,
        );

  final String? arg;
  final FormMode mode;

  @override
  bool operator ==(Object other) {
    return other is ServiceOrderFormControllerProvider &&
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
  FutureOr<ServiceOrderModel?> runNotifierBuild(
    covariant ServiceOrderFormController notifier,
  ) {
    return notifier.build(
      arg,
      mode,
    );
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
