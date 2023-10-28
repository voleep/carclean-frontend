// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$searchControllerHash() => r'26cf60a28467bb4db8fecab4c1da9dd1242c0260';

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

abstract class _$SearchController extends BuildlessAutoDisposeNotifier<
    AsyncValue<PaginationModel<Map<String, dynamic>>?>> {
  late final SearchConfig arg;

  AsyncValue<PaginationModel<Map<String, dynamic>>?> build(
    SearchConfig arg,
  );
}

/// See also [SearchController].
@ProviderFor(SearchController)
const searchControllerProvider = SearchControllerFamily();

/// See also [SearchController].
class SearchControllerFamily
    extends Family<AsyncValue<PaginationModel<Map<String, dynamic>>?>> {
  /// See also [SearchController].
  const SearchControllerFamily();

  /// See also [SearchController].
  SearchControllerProvider call(
    SearchConfig arg,
  ) {
    return SearchControllerProvider(
      arg,
    );
  }

  @override
  SearchControllerProvider getProviderOverride(
    covariant SearchControllerProvider provider,
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
  String? get name => r'searchControllerProvider';
}

/// See also [SearchController].
class SearchControllerProvider extends AutoDisposeNotifierProviderImpl<
    SearchController, AsyncValue<PaginationModel<Map<String, dynamic>>?>> {
  /// See also [SearchController].
  SearchControllerProvider(
    this.arg,
  ) : super.internal(
          () => SearchController()..arg = arg,
          from: searchControllerProvider,
          name: r'searchControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$searchControllerHash,
          dependencies: SearchControllerFamily._dependencies,
          allTransitiveDependencies:
              SearchControllerFamily._allTransitiveDependencies,
        );

  final SearchConfig arg;

  @override
  bool operator ==(Object other) {
    return other is SearchControllerProvider && other.arg == arg;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, arg.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  AsyncValue<PaginationModel<Map<String, dynamic>>?> runNotifierBuild(
    covariant SearchController notifier,
  ) {
    return notifier.build(
      arg,
    );
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
