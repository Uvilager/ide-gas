import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:frontend/features/groceries/data/grocery_repository.dart';
import 'package:frontend/features/groceries/models/grocery_model.dart';
import 'package:frontend/features/groceries/presentation/drawer_widget.dart';
import 'package:frontend/features/groceries/presentation/grocery_widget.dart';

class GroceriesScreen extends ConsumerWidget {
  const GroceriesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final groceries = ref.watch(groceriesProvider);
    return groceries.when(
      skipLoadingOnReload: true,
      data: (data) => _buildGroceryList(context, data, ref),
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stack) => Text(error.toString()),
    );
  }

  Widget _buildGroceryList(
      BuildContext context, List<Grocery> groceries, WidgetRef ref) {
    return Scaffold(
      drawer: const DrawerWidget(),
      appBar: AppBar(title: const Text('Your Groceries'), actions: [
        //** IconButton to go to the cart */
        IconButton(
          icon: const Icon(Icons.shopping_cart),
          onPressed: () => context.go('/cart'),
        )
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.go('/groceries/add');
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