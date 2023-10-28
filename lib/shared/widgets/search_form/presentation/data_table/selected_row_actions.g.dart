// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'selected_row_actions.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$selectedRowActionsHash() =>
    r'd89f9026d35f7767ccd0eda39576baa45fc4b321';

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

abstract class _$SelectedRowActions
    extends BuildlessAutoDisposeNotifier<List<ActionOption>?> {
  late final Key tableKey;

  List<ActionOption>? build(
    Key tableKey,
  );
}

/// See also [SelectedRowActions].
@ProviderFor(SelectedRowActions)
const selectedRowActionsProvider = SelectedRowActionsFamily();

/// See also [SelectedRowActions].
class SelectedRowActionsFamily extends Family<List<ActionOption>?> {
  /// See also [SelectedRowActions].
  const SelectedRowActionsFamily();

  /// See also [SelectedRowActions].
  SelectedRowActionsProvider call(
    Key tableKey,
  ) {
    return SelectedRowActionsProvider(
      tableKey,
    );
  }

  @override
  SelectedRowActionsProvider getProviderOverride(
    covariant SelectedRowActionsProvider provider,
  ) {
    return call(
      provider.tableKey,
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
  String? get name => r'selectedRowActionsProvider';
}

/// See also [SelectedRowActions].
class SelectedRowActionsProvider extends AutoDisposeNotifierProviderImpl<
    SelectedRowActions, List<ActionOption>?> {
  /// See also [SelectedRowActions].
  SelectedRowActionsProvider(
    this.tableKey,
  ) : super.internal(
          () => SelectedRowActions()..tableKey = tableKey,
          from: selectedRowActionsProvider,
          name: r'selectedRowActionsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$selectedRowActionsHash,
          dependencies: SelectedRowActionsFamily._dependencies,
          allTransitiveDependencies:
              SelectedRowActionsFamily._allTransitiveDependencies,
        );

  final Key tableKey;

  @override
  bool operator ==(Object other) {
    return other is SelectedRowActionsProvider && other.tableKey == tableKey;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, tableKey.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  List<ActionOption>? runNotifierBuild(
    covariant SelectedRowActions notifier,
  ) {
    return notifier.build(
      tableKey,
    );
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
