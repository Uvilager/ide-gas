import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:frontend/features/groceries/presentation/controllers/grocery_controller.dart';
import 'package:frontend/features/groceries/models/grocery_model.dart';

class GroceryWidget extends ConsumerWidget {
  const GroceryWidget({super.key, required this.grocery});

  final Grocery grocery;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<AsyncValue>(groceryControllerProvider, (previous, next) {
      ScaffoldMessenger.of(context).clearSnackBars();
      if (next.hasError == false) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Grocery deleted successfully'),
          ),
        );
      }
    });
    return InkWell(
      onTap: () {
        // Navigate to the grocery details page
        context.go('/groceries/${grocery.id}');
      },
      child: Dismissible(
        key: Key(grocery.name),
        onDismissed: (direction) {
          // Delete the grocery from the database
          ref
              .read(groceryControllerProvider.notifier)
              .deleteGrocery(grocery.id);
        },
        // Show the grocery's name and quantity
        child: ListTile(
          title: Text(grocery.name),
          trailing: Text(grocery.quantity.toString()),
        ),
      ),
    );
  }
}
