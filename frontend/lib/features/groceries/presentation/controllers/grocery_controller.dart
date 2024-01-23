import 'dart:async';
import 'package:frontend/routing/app_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:frontend/features/groceries/data/grocery_repository.dart';

part 'grocery_controller.g.dart';

// Grocery Notifier
@riverpod
class GroceryController extends _$GroceryController {
  @override
  FutureOr<void> build() {}

  // Add a new grocery to the database
  Future<void> addGrocery(String name, int quantity) async {
    final groceryRepository = ref.read(groceryRepositoryProvider);
    state = const AsyncLoading();
    state = await AsyncValue.guard(
        () => groceryRepository.addGrocery(name, quantity));
    if (state.hasError == false) {
      ref.read(routerProvider).pop();
    }
  }

  // Update a grocery in the database
  Future<void> updateGrocery(String id, String name, int quantity) async {
    final groceryRepository = ref.read(groceryRepositoryProvider);
    state = const AsyncLoading();
    state = await AsyncValue.guard(
        () => groceryRepository.updateGrocery(id, name, quantity));
    if (state.hasError == false) {
      ref.read(routerProvider).pop();
    }
  }

  // Delete a grocery from the database
  Future<void> deleteGrocery(int id) async {
    final groceryRepository = ref.read(groceryRepositoryProvider);
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => groceryRepository.deleteGrocery(id));
  }
}
