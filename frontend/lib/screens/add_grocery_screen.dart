import 'package:flutter/material.dart';

import 'package:frontend/widgets/add_form_widget.dart';

class AddGroceryScreen extends StatelessWidget {
  const AddGroceryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Grocery'),
      ),
      body: const AddGroceryWidget(),
    );
  }
}
