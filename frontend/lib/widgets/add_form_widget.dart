import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:frontend/providers/grocery_notifier_repository.dart';

class AddGroceryWidget extends ConsumerStatefulWidget {
  const AddGroceryWidget({super.key, required this.title, this.id});
  final String title;
  final int? id;

  @override
  ConsumerState<AddGroceryWidget> createState() => _AddGroceryWidgetState();
}

class _AddGroceryWidgetState extends ConsumerState<AddGroceryWidget> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();

  String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Name is required';
    }
    return null;
  }

  String? validateQuantity(String? value) {
    if (value == null || value.isEmpty) {
      return 'Quantity is required';
    }
    int? quantity = int.tryParse(value);
    if (quantity == null || quantity <= 0) {
      return 'Enter a valid quantity';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: nameController,
              decoration: const InputDecoration(labelText: 'Name'),
              validator: validateName,
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              controller: quantityController,
              decoration: const InputDecoration(labelText: 'Quantity'),
              keyboardType: TextInputType.number,
              validator: validateQuantity,
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              child: const Text('Submit'),
              onPressed: () {
                if (_formKey.currentState?.validate() ?? false) {
                  String name = nameController.text.trim();
                  int quantity = int.parse(quantityController.text);
                  if (widget.title == 'Add Grocery') {
                    ref
                        .read(groceryNotifierProvider.notifier)
                        .addGrocery(name, quantity);
                  } else {
                    ref.read(groceryNotifierProvider.notifier).updateGrocery(
                          widget.id!,
                          name,
                          quantity,
                        );
                  }
                  nameController.clear();
                  quantityController.clear();
                  // Navigator.pop(context); // Close the form after submission
                } else {
                  // Show an error message or handle invalid input
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
