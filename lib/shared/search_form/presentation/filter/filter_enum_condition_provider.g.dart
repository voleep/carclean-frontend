// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filter_enum_condition_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$filterEnumConditionHash() =>
    r'df9d407c16a3f814c9fdfc52b71b1da8d59744f1';

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

abstract class _$FilterEnumCondition
    extends BuildlessAutoDisposeNotifier<FilterCondition> {
  late final SearchConfig config;

  FilterCondition build(
    SearchConfig config,
  );
}

/// See also [FilterEnumCondition].
@ProviderFor(FilterEnumCondition)
const filterEnumConditionProvider = FilterEnumConditionFamily();

/// See also [FilterEnumCondition].
class FilterEnumConditionFamily extends Family<FilterCondition> {
  /// See also [FilterEnumCondition].
  const FilterEnumConditionFamily();

  /// See also [FilterEnumCondition].
  FilterEnumConditionProvider call(
    SearchConfig config,
  ) {
    return FilterEnumConditionProvider(
      config,
    );
  }

  @override
  FilterEnumConditionProvider getProviderOverride(
    covariant FilterEnumConditionProvider provider,
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
  String? get name => r'filterEnumConditionProvider';
}

/// See also [FilterEnumCondition].
class FilterEnumConditionProvider extends AutoDisposeNotifierProviderImpl<
    FilterEnumCondition, FilterCondition> {
  /// See also [FilterEnumCondition].
  FilterEnumConditionProvider(
    this.config,
  ) : super.internal(
          () => FilterEnumCondition()..config = config,
          from: filterEnumConditionProvider,
          name: r'filterEnumConditionProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$filterEnumConditionHash,
          dependencies: FilterEnumConditionFamily._dependencies,
          allTransitiveDependencies:
              FilterEnumConditionFamily._allTransitiveDependencies,
        );

  final SearchConfig config;

  @override
  bool operator ==(Object other) {
    return other is FilterEnumConditionProvider && other.config == config;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, config.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  FilterCondition runNotifierBuild(
    covariant FilterEnumCondition notifier,
  ) {
    return notifier.build(
      config,
    );
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
