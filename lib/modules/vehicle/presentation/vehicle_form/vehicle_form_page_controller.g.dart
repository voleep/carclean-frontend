// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_form_page_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$vehicleFormPageControllerHash() =>
    r'ffe88ca90bb1907014036693a0f814d50eed114f';

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

abstract class _$VehicleFormPageController
    extends BuildlessAutoDisposeNotifier<AsyncValue<Vehicle?>> {
  late final String arg;

  AsyncValue<Vehicle?> build(
    String arg,
  );
}

/// See also [VehicleFormPageController].
@ProviderFor(VehicleFormPageController)
const vehicleFormPageControllerProvider = VehicleFormPageControllerFamily();

/// See also [VehicleFormPageController].
class VehicleFormPageControllerFamily extends Family<AsyncValue<Vehicle?>> {
  /// See also [VehicleFormPageController].
  const VehicleFormPageControllerFamily();

  /// See also [VehicleFormPageController].
  VehicleFormPageControllerProvider call(
    String arg,
  ) {
    return VehicleFormPageControllerProvider(
      arg,
    );
  }

  @override
  VehicleFormPageControllerProvider getProviderOverride(
    covariant VehicleFormPageControllerProvider provider,
  ) {
    return call(
      provider.arg,
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
  String? get name => r'vehicleFormPageControllerProvider';
}

/// See also [VehicleFormPageController].
class VehicleFormPageControllerProvider extends AutoDisposeNotifierProviderImpl<
    VehicleFormPageController, AsyncValue<Vehicle?>> {
  /// See also [VehicleFormPageController].
  VehicleFormPageControllerProvider(
    this.arg,
  ) : super.internal(
          () => VehicleFormPageController()..arg = arg,
          from: vehicleFormPageControllerProvider,
          name: r'vehicleFormPageControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$vehicleFormPageControllerHash,
          dependencies: VehicleFormPageControllerFamily._dependencies,
          allTransitiveDependencies:
              VehicleFormPageControllerFamily._allTransitiveDependencies,
        );

  final String arg;

  @override
  bool operator ==(Object other) {
    return other is VehicleFormPageControllerProvider && other.arg == arg;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, arg.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  AsyncValue<Vehicle?> runNotifierBuild(
    covariant VehicleFormPageController notifier,
  ) {
    return notifier.build(
      arg,
    );
  }
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member
