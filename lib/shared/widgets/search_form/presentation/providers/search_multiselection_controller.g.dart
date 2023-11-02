// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_multiselection_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$searchMultiSelectionControllerHash() =>
    r'75ab2d10025ac915695e127023bb9adf110ded3a';

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
    extends BuildlessAutoDisposeNotifier<List<dynamic>> {
  late final SearchConfig config;

  List<dynamic> build(
    SearchConfig config,
  );
}

/// See also [SearchMultiSelectionController].
@ProviderFor(SearchMultiSelectionController)
const searchMultiSelectionControllerProvider =
    SearchMultiSelectionControllerFamily();

/// See also [SearchMultiSelectionController].
class SearchMultiSelectionControllerFamily extends Family<List<dynamic>> {
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
        List<dynamic>> {
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
  List<dynamic> runNotifierBuild(
    covariant SearchMultiSelectionController notifier,
  ) {
    return notifier.build(
      config,
    );
  }
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member
