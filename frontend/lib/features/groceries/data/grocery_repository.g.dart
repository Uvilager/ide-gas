// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'grocery_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$groceryRepositoryHash() => r'330ea07aaa6645b46ddedae495c23a6a21381fde';

/// See also [groceryRepository].
@ProviderFor(groceryRepository)
final groceryRepositoryProvider =
    AutoDisposeProvider<GroceryRepository>.internal(
  groceryRepository,
  name: r'groceryRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$groceryRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GroceryRepositoryRef = AutoDisposeProviderRef<GroceryRepository>;
String _$groceriesHash() => r'916479e9a2dfb6601dc46fc2feb4b54265202c59';

/// See also [groceries].
@ProviderFor(groceries)
final groceriesProvider = AutoDisposeFutureProvider<List<Grocery>>.internal(
  groceries,
  name: r'groceriesProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$groceriesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GroceriesRef = AutoDisposeFutureProviderRef<List<Grocery>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
