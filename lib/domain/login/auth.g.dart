// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$loginUserHash() => r'5f29c7a1fc0ff168b2d73fa9928fb04757cbb2c7';

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

typedef LoginUserRef = AutoDisposeFutureProviderRef<String?>;

/// See also [loginUser].
@ProviderFor(loginUser)
const loginUserProvider = LoginUserFamily();

/// See also [loginUser].
class LoginUserFamily extends Family<AsyncValue<String?>> {
  /// See also [loginUser].
  const LoginUserFamily();

  /// See also [loginUser].
  LoginUserProvider call(
    Map<String, dynamic> data,
  ) {
    return LoginUserProvider(
      data,
    );
  }

  @override
  LoginUserProvider getProviderOverride(
    covariant LoginUserProvider provider,
  ) {
    return call(
      provider.data,
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
  String? get name => r'loginUserProvider';
}

/// See also [loginUser].
class LoginUserProvider extends AutoDisposeFutureProvider<String?> {
  /// See also [loginUser].
  LoginUserProvider(
    this.data,
  ) : super.internal(
          (ref) => loginUser(
            ref,
            data,
          ),
          from: loginUserProvider,
          name: r'loginUserProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$loginUserHash,
          dependencies: LoginUserFamily._dependencies,
          allTransitiveDependencies: LoginUserFamily._allTransitiveDependencies,
        );

  final Map<String, dynamic> data;

  @override
  bool operator ==(Object other) {
    return other is LoginUserProvider && other.data == data;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, data.hashCode);

    return _SystemHash.finish(hash);
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
