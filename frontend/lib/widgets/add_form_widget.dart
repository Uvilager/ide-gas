import 'package:flutter/material.dart';

class AddGroceryWidget extends StatefulWidget {
  const AddGroceryWidget({super.key});

  @override
  State<AddGroceryWidget> createState() => _AddGroceryWidgetState();
}

class _AddGroceryWidgetState extends State<AddGroceryWidget> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
            controller: nameController,
            decoration: const InputDecoration(labelText: 'Name'),
          ),
          const SizedBox(height: 16.0),
          TextField(
            controller: quantityController,
            decoration: const InputDecoration(labelText: 'Quantity'),
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: () {
              String name = nameController.text.trim();
              int quantity = int.tryParse(quantityController.text) ?? 0;

              if (name.isNotEmpty && quantity > 0) {
                // TODO Add the grocery to the database
                Navigator.pop(context); // Close the form after submission
              } else {
                // Show an error message or handle invalid input
              }
            },
            child: const Text('Submit'),
          ),
        ],
      ),
    );
  }
}
