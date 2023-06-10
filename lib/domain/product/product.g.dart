// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getAllProductsHash() => r'06a3f0952a5c3794819133d57a4b33c60202244b';

/// See also [getAllProducts].
@ProviderFor(getAllProducts)
final getAllProductsProvider =
    AutoDisposeFutureProvider<List<ProductModel>>.internal(
  getAllProducts,
  name: r'getAllProductsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getAllProductsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetAllProductsRef = AutoDisposeFutureProviderRef<List<ProductModel>>;
String _$getSingleProductHash() => r'ec5234e10138657942e1626226e7331550b6517f';

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

typedef GetSingleProductRef = AutoDisposeFutureProviderRef<ProductModel>;

/// See also [getSingleProduct].
@ProviderFor(getSingleProduct)
const getSingleProductProvider = GetSingleProductFamily();

/// See also [getSingleProduct].
class GetSingleProductFamily extends Family<AsyncValue<ProductModel>> {
  /// See also [getSingleProduct].
  const GetSingleProductFamily();

  /// See also [getSingleProduct].
  GetSingleProductProvider call(
    String productID,
  ) {
    return GetSingleProductProvider(
      productID,
    );
  }

  @override
  GetSingleProductProvider getProviderOverride(
    covariant GetSingleProductProvider provider,
  ) {
    return call(
      provider.productID,
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
  String? get name => r'getSingleProductProvider';
}

/// See also [getSingleProduct].
class GetSingleProductProvider extends AutoDisposeFutureProvider<ProductModel> {
  /// See also [getSingleProduct].
  GetSingleProductProvider(
    this.productID,
  ) : super.internal(
          (ref) => getSingleProduct(
            ref,
            productID,
          ),
          from: getSingleProductProvider,
          name: r'getSingleProductProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getSingleProductHash,
          dependencies: GetSingleProductFamily._dependencies,
          allTransitiveDependencies:
              GetSingleProductFamily._allTransitiveDependencies,
        );

  final String productID;

  @override
  bool operator ==(Object other) {
    return other is GetSingleProductProvider && other.productID == productID;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, productID.hashCode);

    return _SystemHash.finish(hash);
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
