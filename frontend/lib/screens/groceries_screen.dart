import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:frontend/models/grocery_model.dart';
import 'package:frontend/providers/grocery_repository.dart';
import 'package:frontend/screens/add_grocery_screen.dart';
import 'package:frontend/widgets/grocery_widget.dart';

class GroceriesScreen extends ConsumerWidget {
  const GroceriesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final groceries = ref.watch(groceriesProvider);
    return groceries.when(
      data: (data) => _buildGroceryList(context, data, ref),
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stack) => Text(error.toString()),
    );
  }

  Widget _buildGroceryList(
      BuildContext context, List<Grocery> groceries, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Groceries'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO Add new Grocery
          Navigator.push(context,
              MaterialPageRoute(builder: (_) => const AddGroceryScreen()));
        },
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: groceries.length,
        itemBuilder: (context, index) => GroceryWidget(
          grocery: groceries[index],
        ),
      ),
    );
  }
}
