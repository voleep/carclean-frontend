// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee_form_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$employeeFormControllerHash() =>
    r'abee09fa8f28c7ec61ab71635f606457eaa0151d';

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

abstract class _$EmployeeFormController
    extends BuildlessAutoDisposeNotifier<AsyncValue<Employee?>> {
  late final String? arg;
  late final FormMode mode;

  AsyncValue<Employee?> build(
    String? arg,
    FormMode mode,
  );
}

/// See also [EmployeeFormController].
@ProviderFor(EmployeeFormController)
const employeeFormControllerProvider = EmployeeFormControllerFamily();

/// See also [EmployeeFormController].
class EmployeeFormControllerFamily extends Family<AsyncValue<Employee?>> {
  /// See also [EmployeeFormController].
  const EmployeeFormControllerFamily();

  /// See also [EmployeeFormController].
  EmployeeFormControllerProvider call(
    String? arg,
    FormMode mode,
  ) {
    return EmployeeFormControllerProvider(
      arg,
      mode,
    );
  }

  @override
  EmployeeFormControllerProvider getProviderOverride(
    covariant EmployeeFormControllerProvider provider,
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
  String? get name => r'employeeFormControllerProvider';
}

/// See also [EmployeeFormController].
class EmployeeFormControllerProvider extends AutoDisposeNotifierProviderImpl<
    EmployeeFormController, AsyncValue<Employee?>> {
  /// See also [EmployeeFormController].
  EmployeeFormControllerProvider(
    this.arg,
    this.mode,
  ) : super.internal(
          () => EmployeeFormController()
            ..arg = arg
            ..mode = mode,
          from: employeeFormControllerProvider,
          name: r'employeeFormControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$employeeFormControllerHash,
          dependencies: EmployeeFormControllerFamily._dependencies,
          allTransitiveDependencies:
              EmployeeFormControllerFamily._allTransitiveDependencies,
        );

  final String? arg;
  final FormMode mode;

  @override
  bool operator ==(Object other) {
    return other is EmployeeFormControllerProvider &&
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
  AsyncValue<Employee?> runNotifierBuild(
    covariant EmployeeFormController notifier,
  ) {
    return notifier.build(
      arg,
      mode,
    );
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
