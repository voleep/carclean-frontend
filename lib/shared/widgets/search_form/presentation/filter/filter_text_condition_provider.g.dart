// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filter_text_condition_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$filterTextConditionHash() =>
    r'79676a5229edd27ae82b3f54693f0264073c78dc';

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

abstract class _$FilterTextCondition
    extends BuildlessAutoDisposeNotifier<FilterCondition> {
  late final SearchConfig config;

  FilterCondition build(
    SearchConfig config,
  );
}

/// See also [FilterTextCondition].
@ProviderFor(FilterTextCondition)
const filterTextConditionProvider = FilterTextConditionFamily();

/// See also [FilterTextCondition].
class FilterTextConditionFamily extends Family<FilterCondition> {
  /// See also [FilterTextCondition].
  const FilterTextConditionFamily();

  /// See also [FilterTextCondition].
  FilterTextConditionProvider call(
    SearchConfig config,
  ) {
    return FilterTextConditionProvider(
      config,
    );
  }

  @override
  FilterTextConditionProvider getProviderOverride(
    covariant FilterTextConditionProvider provider,
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
  String? get name => r'filterTextConditionProvider';
}

/// See also [FilterTextCondition].
class FilterTextConditionProvider extends AutoDisposeNotifierProviderImpl<
    FilterTextCondition, FilterCondition> {
  /// See also [FilterTextCondition].
  FilterTextConditionProvider(
    this.config,
  ) : super.internal(
          () => FilterTextCondition()..config = config,
          from: filterTextConditionProvider,
          name: r'filterTextConditionProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$filterTextConditionHash,
          dependencies: FilterTextConditionFamily._dependencies,
          allTransitiveDependencies:
              FilterTextConditionFamily._allTransitiveDependencies,
        );

  final SearchConfig config;

  @override
  bool operator ==(Object other) {
    return other is FilterTextConditionProvider && other.config == config;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, config.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  FilterCondition runNotifierBuild(
    covariant FilterTextCondition notifier,
  ) {
    return notifier.build(
      config,
    );
  }
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member
