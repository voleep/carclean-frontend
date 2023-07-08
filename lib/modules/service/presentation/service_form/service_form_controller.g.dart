// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_form_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$serviceFormControllerHash() =>
    r'7ce1165eafec011896984c6d544e00c25f32a11f';

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

abstract class _$ServiceFormController
    extends BuildlessAutoDisposeAsyncNotifier<ServiceModel?> {
  late final String? arg;
  late final FormMode mode;

  FutureOr<ServiceModel?> build(
    String? arg,
    FormMode mode,
  );
}

/// See also [ServiceFormController].
@ProviderFor(ServiceFormController)
const serviceFormControllerProvider = ServiceFormControllerFamily();

/// See also [ServiceFormController].
class ServiceFormControllerFamily extends Family<AsyncValue<ServiceModel?>> {
  /// See also [ServiceFormController].
  const ServiceFormControllerFamily();

  /// See also [ServiceFormController].
  ServiceFormControllerProvider call(
    String? arg,
    FormMode mode,
  ) {
    return ServiceFormControllerProvider(
      arg,
      mode,
    );
  }

  @override
  ServiceFormControllerProvider getProviderOverride(
    covariant ServiceFormControllerProvider provider,
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
  String? get name => r'serviceFormControllerProvider';
}

/// See also [ServiceFormController].
class ServiceFormControllerProvider
    extends AutoDisposeAsyncNotifierProviderImpl<ServiceFormController,
        ServiceModel?> {
  /// See also [ServiceFormController].
  ServiceFormControllerProvider(
    this.arg,
    this.mode,
  ) : super.internal(
          () => ServiceFormController()
            ..arg = arg
            ..mode = mode,
          from: serviceFormControllerProvider,
          name: r'serviceFormControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$serviceFormControllerHash,
          dependencies: ServiceFormControllerFamily._dependencies,
          allTransitiveDependencies:
              ServiceFormControllerFamily._allTransitiveDependencies,
        );

  final String? arg;
  final FormMode mode;

  @override
  bool operator ==(Object other) {
    return other is ServiceFormControllerProvider &&
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
  FutureOr<ServiceModel?> runNotifierBuild(
    covariant ServiceFormController notifier,
  ) {
    return notifier.build(
      arg,
      mode,
    );
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
