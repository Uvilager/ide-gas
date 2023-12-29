import 'package:flutter/material.dart';
import 'package:frontend/models/grocery_model.dart';

class GroceryWidget extends StatelessWidget {
  const GroceryWidget({super.key, required this.grocery});

  final Grocery grocery;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(grocery.name),
      trailing: Text(grocery.quantity.toString()),
    );
  }
}
