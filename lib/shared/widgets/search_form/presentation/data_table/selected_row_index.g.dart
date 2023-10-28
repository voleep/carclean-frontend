// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'selected_row_index.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$selectedRowIndexHash() => r'e27ae3f90aaf1b759b6b3b137343abe05caed5dc';

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

abstract class _$SelectedRowIndex extends BuildlessAutoDisposeNotifier<int?> {
  late final Key tableKey;

  int? build(
    Key tableKey,
  );
}

/// See also [SelectedRowIndex].
@ProviderFor(SelectedRowIndex)
const selectedRowIndexProvider = SelectedRowIndexFamily();

/// See also [SelectedRowIndex].
class SelectedRowIndexFamily extends Family<int?> {
  /// See also [SelectedRowIndex].
  const SelectedRowIndexFamily();

  /// See also [SelectedRowIndex].
  SelectedRowIndexProvider call(
    Key tableKey,
  ) {
    return SelectedRowIndexProvider(
      tableKey,
    );
  }

  @override
  SelectedRowIndexProvider getProviderOverride(
    covariant SelectedRowIndexProvider provider,
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
  String? get name => r'selectedRowIndexProvider';
}

/// See also [SelectedRowIndex].
class SelectedRowIndexProvider
    extends AutoDisposeNotifierProviderImpl<SelectedRowIndex, int?> {
  /// See also [SelectedRowIndex].
  SelectedRowIndexProvider(
    this.tableKey,
  ) : super.internal(
          () => SelectedRowIndex()..tableKey = tableKey,
          from: selectedRowIndexProvider,
          name: r'selectedRowIndexProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$selectedRowIndexHash,
          dependencies: SelectedRowIndexFamily._dependencies,
          allTransitiveDependencies:
              SelectedRowIndexFamily._allTransitiveDependencies,
        );

  final Key tableKey;

  @override
  bool operator ==(Object other) {
    return other is SelectedRowIndexProvider && other.tableKey == tableKey;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, tableKey.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  int? runNotifierBuild(
    covariant SelectedRowIndex notifier,
  ) {
    return notifier.build(
      tableKey,
    );
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
