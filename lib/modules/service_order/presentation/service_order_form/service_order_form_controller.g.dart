// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_order_form_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$serviceOrderFormControllerHash() =>
    r'6ad12265d73d1eb6ca9695725a8382fa919279b7';

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
    extends BuildlessAutoDisposeNotifier<ServiceOrderModel?> {
  late final String? serviceOrderId;

  ServiceOrderModel? build(
    String? serviceOrderId,
  );
}

/// See also [ServiceOrderFormController].
@ProviderFor(ServiceOrderFormController)
const serviceOrderFormControllerProvider = ServiceOrderFormControllerFamily();

/// See also [ServiceOrderFormController].
class ServiceOrderFormControllerFamily extends Family<ServiceOrderModel?> {
  /// See also [ServiceOrderFormController].
  const ServiceOrderFormControllerFamily();

  /// See also [ServiceOrderFormController].
  ServiceOrderFormControllerProvider call(
    String? serviceOrderId,
  ) {
    return ServiceOrderFormControllerProvider(
      serviceOrderId,
    );
  }

  @override
  ServiceOrderFormControllerProvider getProviderOverride(
    covariant ServiceOrderFormControllerProvider provider,
  ) {
    return call(
      provider.serviceOrderId,
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
    extends AutoDisposeNotifierProviderImpl<ServiceOrderFormController,
        ServiceOrderModel?> {
  /// See also [ServiceOrderFormController].
  ServiceOrderFormControllerProvider(
    this.serviceOrderId,
  ) : super.internal(
          () => ServiceOrderFormController()..serviceOrderId = serviceOrderId,
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

  final String? serviceOrderId;

  @override
  bool operator ==(Object other) {
    return other is ServiceOrderFormControllerProvider &&
        other.serviceOrderId == serviceOrderId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, serviceOrderId.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  ServiceOrderModel? runNotifierBuild(
    covariant ServiceOrderFormController notifier,
  ) {
    return notifier.build(
      serviceOrderId,
    );
  }
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member
