// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$searchRepositoryHash() => r'c686d0bdf378e305e4f4f599724c3ef36e4b85e9';

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

typedef SearchRepositoryRef = AutoDisposeProviderRef<SearchRepository>;

/// See also [searchRepository].
@ProviderFor(searchRepository)
const searchRepositoryProvider = SearchRepositoryFamily();

/// See also [searchRepository].
class SearchRepositoryFamily extends Family<SearchRepository> {
  /// See also [searchRepository].
  const SearchRepositoryFamily();

  /// See also [searchRepository].
  SearchRepositoryProvider call(
    String endpoint,
  ) {
    return SearchRepositoryProvider(
      endpoint,
    );
  }

  @override
  SearchRepositoryProvider getProviderOverride(
    covariant SearchRepositoryProvider provider,
  ) {
    return call(
      provider.endpoint,
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
  String? get name => r'searchRepositoryProvider';
}

/// See also [searchRepository].
class SearchRepositoryProvider extends AutoDisposeProvider<SearchRepository> {
  /// See also [searchRepository].
  SearchRepositoryProvider(
    this.endpoint,
  ) : super.internal(
          (ref) => searchRepository(
            ref,
            endpoint,
          ),
          from: searchRepositoryProvider,
          name: r'searchRepositoryProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$searchRepositoryHash,
          dependencies: SearchRepositoryFamily._dependencies,
          allTransitiveDependencies:
              SearchRepositoryFamily._allTransitiveDependencies,
        );

  final String endpoint;

  @override
  bool operator ==(Object other) {
    return other is SearchRepositoryProvider && other.endpoint == endpoint;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, endpoint.hashCode);

    return _SystemHash.finish(hash);
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
