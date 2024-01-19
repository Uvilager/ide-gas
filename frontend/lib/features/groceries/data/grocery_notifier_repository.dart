import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:frontend/features/groceries/models/grocery_model.dart';
import 'package:frontend/utils/dio_client.dart';

// Grocery Notifier
class GroceryNotifier extends AsyncNotifier<List<Grocery>> {
  @override

  // Fetch all groceries from the database
  FutureOr<List<Grocery>> build() async {
    final dio = ref.watch(dioProvider);
    final response = await dio.get('groceries');
    if (response.statusCode == 200) {
      final List<dynamic> data = response.data;
      final List<Grocery> groceries =
          data.map((item) => Grocery.fromMap(item)).toList();
      return groceries;
    } else {
      throw Exception('Failed to fetch groceries');
    }

    // final response =
    //     await http.get(Uri.parse('http://192.168.100.29:3000/groceries'));
    // if (response.statusCode == 200) {
    //   final List<dynamic> data = json.decode(response.body);
    //   final List<Grocery> groceries =
    //       data.map((item) => Grocery.fromMap(item)).toList();
    //   return groceries;
    // } else {
    //   throw Exception('Failed to fetch groceries');
    // }
  }

  // Add a new grocery to the database
  Future<void> addGrocery(String name, int quantity) async {
    final dio = ref.watch(dioProvider);
    final response =
        await dio.post('groceries', data: {'name': name, 'quantity': quantity});
    if (response.statusCode == 201) {
      ref.invalidateSelf();
      // Successful POST request (status code 201 Created)
      print('Grocery added successfully!');
    } else {
      // Handle other status codes or errors
      print('Failed to add grocery. Status code: ${response.statusCode}');
    }
  }

  // Future<void> addGrocery(String name, int quantity) async {
  //   final url = Uri.parse('http://192.168.100.29:3000/groceries');
  //   final Map<String, dynamic> data = {
  //     'name': name,
  //     'quantity': quantity,
  //   };
  //   try {
  //     final response = await http.post(
  //       url,
  //       headers: {'Content-Type': 'application/json'},
  //       body: json.encode(data),
  //     );
  //     if (response.statusCode == 201) {
  //       ref.invalidateSelf();
  //       // Successful POST request (status code 201 Created)
  //       print('Grocery added successfully!');
  //     } else {
  //       // Handle other status codes or errors
  //       print('Failed to add grocery. Status code: ${response.statusCode}');
  //     }
  //   } catch (error) {
  //     // Handle network or server errors
  //     print('Error adding grocery: $error');
  //   }
  // }

  // Delete a grocery from the database
  Future<void> deleteGrocery(int id) async {
    final dio = ref.watch(dioProvider);
    final response = await dio.delete('groceries/$id');
    if (response.statusCode == 200) {
      // ref.invalidateSelf();
      // TODO : Invalidate self and Inkwell not updating
      // Successful DELETE request (status code 200 OK)
      print('Grocery deleted successfully!');
    } else {
      // Handle other status codes or errors
      print('Failed to delete grocery. Status code: ${response.statusCode}');
    }
  }

  // Future<void> deleteGrocery(int id) async {
  //   final url = Uri.parse('http://192.168.100.29:3000/groceries/$id');
  //   try {
  //     final response = await http.delete(url);
  //     if (response.statusCode == 200) {
  //       // ref.invalidateSelf();
  //       // Successful DELETE request (status code 200 OK)
  //       print('Grocery deleted successfully!');
  //     } else {
  //       // Handle other status codes or errors
  //       print('Failed to delete grocery. Status code: ${response.statusCode}');
  //     }
  //   } catch (error) {
  //     // Handle network or server errors
  //     print('Error deleting grocery: $error');
  //   }
  // }

  // Update a grocery in the database
  Future<void> updateGrocery(String id, String name, int quantity) async {
    final dio = ref.watch(dioProvider);
    final response = await dio
        .patch('groceries/$id', data: {'name': name, 'quantity': quantity});
    if (response.statusCode == 200) {
      ref.invalidateSelf();
      // Successful PUT request (status code 200 OK)
      print('Grocery updated successfully!');
    } else {
      // Handle other status codes or errors
      print('Failed to update grocery. Status code: ${response.statusCode}');
    }
  }

  // Future<void> updateGrocery(int id, String name, int quantity) async {
  //   final url = Uri.parse('http://192.168.100.29:3000/groceries/$id');
  //   final Map<String, dynamic> data = {
  //     'name': name,
  //     'quantity': quantity,
  //   };
  //   try {
  //     final response = await http.patch(
  //       url,
  //       headers: {'Content-Type': 'application/json'},
  //       body: json.encode(data),
  //     );
  //     if (response.statusCode == 200) {
  //       ref.invalidateSelf();
  //       // Successful PUT request (status code 200 OK)
  //       print('Grocery updated successfully!');
  //     } else {
  //       // Handle other status codes or errors
  //       print('Failed to update grocery. Status code: ${response.statusCode}');
  //     }
  //   } catch (error) {
  //     // Handle network or server errors
  //     print('Error updating grocery: $error');
  //   }
  // }
}

// Grocery Notifier Provider
final groceryNotifierProvider =
    AsyncNotifierProvider<GroceryNotifier, List<Grocery>>(() {
  return GroceryNotifier();
});
