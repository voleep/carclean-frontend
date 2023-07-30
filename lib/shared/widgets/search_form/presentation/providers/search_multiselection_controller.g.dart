// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_multiselection_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$searchMultiSelectionControllerHash() =>
    r'65bfa0449b3237b72952b647ea2dcda3f9cff6e8';

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

abstract class _$SearchMultiSelectionController
    extends BuildlessAutoDisposeNotifier<List<Object>> {
  late final SearchConfig config;

  List<Object> build(
    SearchConfig config,
  );
}

/// See also [SearchMultiSelectionController].
@ProviderFor(SearchMultiSelectionController)
const searchMultiSelectionControllerProvider =
    SearchMultiSelectionControllerFamily();

/// See also [SearchMultiSelectionController].
class SearchMultiSelectionControllerFamily extends Family<List<Object>> {
  /// See also [SearchMultiSelectionController].
  const SearchMultiSelectionControllerFamily();

  /// See also [SearchMultiSelectionController].
  SearchMultiSelectionControllerProvider call(
    SearchConfig config,
  ) {
    return SearchMultiSelectionControllerProvider(
      config,
    );
  }

  @override
  SearchMultiSelectionControllerProvider getProviderOverride(
    covariant SearchMultiSelectionControllerProvider provider,
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
  String? get name => r'searchMultiSelectionControllerProvider';
}

/// See also [SearchMultiSelectionController].
class SearchMultiSelectionControllerProvider
    extends AutoDisposeNotifierProviderImpl<SearchMultiSelectionController,
        List<Object>> {
  /// See also [SearchMultiSelectionController].
  SearchMultiSelectionControllerProvider(
    this.config,
  ) : super.internal(
          () => SearchMultiSelectionController()..config = config,
          from: searchMultiSelectionControllerProvider,
          name: r'searchMultiSelectionControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$searchMultiSelectionControllerHash,
          dependencies: SearchMultiSelectionControllerFamily._dependencies,
          allTransitiveDependencies:
              SearchMultiSelectionControllerFamily._allTransitiveDependencies,
        );

  final SearchConfig config;

  @override
  bool operator ==(Object other) {
    return other is SearchMultiSelectionControllerProvider &&
        other.config == config;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, config.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  List<Object> runNotifierBuild(
    covariant SearchMultiSelectionController notifier,
  ) {
    return notifier.build(
      config,
    );
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
