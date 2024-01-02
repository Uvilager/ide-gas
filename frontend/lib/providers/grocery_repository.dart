import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

import 'package:frontend/models/grocery_model.dart';

// NOT USED CURRENTLY !!!
class GroceryRepository {
  Future<List<Grocery>> fetchGroceries() async {
    final response =
        await http.get(Uri.parse('http://192.168.100.29:3000/groceries'));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      final List<Grocery> groceries =
          data.map((item) => Grocery.fromMap(item)).toList();
      return groceries;
    } else {
      throw Exception('Failed to fetch groceries');
    }
  }

  Future<void> addGrocery(String name, int quantity) async {
    final url = Uri.parse('http://192.168.100.29:3000/groceries');
    final Map<String, dynamic> data = {
      'name': name,
      'quantity': quantity,
    };
    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode(data),
      );
      if (response.statusCode == 201) {
        // Successful POST request (status code 201 Created)
        print('Grocery added successfully!');
      } else {
        // Handle other status codes or errors
        print('Failed to add grocery. Status code: ${response.statusCode}');
      }
    } catch (error) {
      // Handle network or server errors
      print('Error adding grocery: $error');
    }
  }
}

final groceryRepositoryProvider = Provider<GroceryRepository>((ref) {
  return GroceryRepository();
});

final groceriesProvider = FutureProvider<List<Grocery>>(
  (ref) {
    final groceryRepository = ref.watch(groceryRepositoryProvider);
    return groceryRepository.fetchGroceries();
  },
);
