// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filter_query.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$filterQueryHash() => r'd167c7de6a0980bcd2a2418d0c8ddebcfc13cae9';

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

abstract class _$FilterQuery
    extends BuildlessAutoDisposeNotifier<List<FilterQueryState>?> {
  late final SearchConfig config;

  List<FilterQueryState>? build(
    SearchConfig config,
  );
}

/// See also [FilterQuery].
@ProviderFor(FilterQuery)
const filterQueryProvider = FilterQueryFamily();

/// See also [FilterQuery].
class FilterQueryFamily extends Family<List<FilterQueryState>?> {
  /// See also [FilterQuery].
  const FilterQueryFamily();

  /// See also [FilterQuery].
  FilterQueryProvider call(
    SearchConfig config,
  ) {
    return FilterQueryProvider(
      config,
    );
  }

  @override
  FilterQueryProvider getProviderOverride(
    covariant FilterQueryProvider provider,
  ) {
    return call(
      provider.config,
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
  String? get name => r'filterQueryProvider';
}

/// See also [FilterQuery].
class FilterQueryProvider extends AutoDisposeNotifierProviderImpl<FilterQuery,
    List<FilterQueryState>?> {
  /// See also [FilterQuery].
  FilterQueryProvider(
    this.config,
  ) : super.internal(
          () => FilterQuery()..config = config,
          from: filterQueryProvider,
          name: r'filterQueryProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$filterQueryHash,
          dependencies: FilterQueryFamily._dependencies,
          allTransitiveDependencies:
              FilterQueryFamily._allTransitiveDependencies,
        );

  final SearchConfig config;

  @override
  bool operator ==(Object other) {
    return other is FilterQueryProvider && other.config == config;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, config.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  List<FilterQueryState>? runNotifierBuild(
    covariant FilterQuery notifier,
  ) {
    return notifier.build(
      config,
    );
  }
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member
