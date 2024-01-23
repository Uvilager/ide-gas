import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:frontend/features/groceries/presentation/controllers/grocery_controller.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:frontend/features/groceries/models/grocery_model.dart';
import 'package:frontend/utils/dio_client.dart';

part 'grocery_repository.g.dart';

class GroceryRepository {
  GroceryRepository(this.dio);
  final Dio dio;

  // Fetch all groceries from the database
  Future<List<Grocery>> fetchGrocery() async {
    final response = await dio.get('groceries');
    if (response.statusCode == 200) {
      final List<dynamic> data = response.data;
      final List<Grocery> groceries =
          data.map((item) => Grocery.fromMap(item)).toList();
      return groceries;
    } else {
      throw Exception('Failed to fetch groceries');
    }
  }

  // Add a new grocery to the database
  Future<void> addGrocery(String name, int quantity) async {
    final response =
        await dio.post('groceries', data: {'name': name, 'quantity': quantity});
    if (response.statusCode == 201) {
      // Successful POST request (status code 201 Created)
      print('Grocery added successfully!');
    } else {
      // Handle other status codes or errors
      print('Failed to add grocery. Status code: ${response.statusCode}');
    }
  }

  // Delete a grocery from the database
  Future<void> deleteGrocery(int id) async {
    final response = await dio.delete('groceries/$id');
    if (response.statusCode == 200) {
      // TODO : Invalidate self and Inkwell not updating
      // Successful DELETE request (status code 200 OK)
      print('Grocery deleted successfully!');
    } else {
      // Handle other status codes or errors
      print('Failed to delete grocery. Status code: ${response.statusCode}');
    }
  }

  // Update a grocery from the database
  Future<void> updateGrocery(String id, String name, int quantity) async {
    final response = await dio
        .patch('groceries/$id', data: {'name': name, 'quantity': quantity});
    if (response.statusCode == 200) {
      // Successful PUT request (status code 200 OK)
      print('Grocery updated successfully!');
    } else {
      // Handle other status codes or errors
      print('Failed to update grocery. Status code: ${response.statusCode}');
    }
  }
}

@riverpod
GroceryRepository groceryRepository(GroceryRepositoryRef ref) {
  final dio = ref.watch(dioProvider);
  return GroceryRepository(dio);
}

@riverpod
Future<List<Grocery>> groceries(GroceriesRef ref) async {
  debugPrint('Fetching groceries...');
  final groceryRepository = ref.watch(groceryRepositoryProvider);
  ref.watch(groceryControllerProvider);
  return groceryRepository.fetchGrocery();
}
