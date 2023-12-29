import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

import 'package:frontend/models/grocery_model.dart';

class GroceryRepository {
  Future<List<Grocery>> fetchGroceries() async {
    final response =
        await http.get(Uri.parse('http://192.168.100.29:3000/groceries'));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      final List<Grocery> groceries =
          data.map((item) => Grocery.fromMap(item)).toList();
      print(groceries);
      return groceries;
    } else {
      throw Exception('Failed to fetch groceries');
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
