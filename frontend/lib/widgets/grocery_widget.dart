import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:frontend/models/grocery_model.dart';
import 'package:frontend/providers/grocery_notifier_repository.dart';
import 'package:frontend/screens/add_grocery_screen.dart';

class GroceryWidget extends ConsumerWidget {
  const GroceryWidget({super.key, required this.grocery});

  final Grocery grocery;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: () {
        // Navigate to the grocery details page
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => AddGroceryScreen(
              grocery: grocery,
              title: 'Edit Grocery',
            ),
          ),
        );
      },
      child: Dismissible(
        key: Key(grocery.name),
        onDismissed: (direction) {
          // Delete the grocery from the database
          ref.read(groceryNotifierProvider.notifier).deleteGrocery(grocery.id);
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
