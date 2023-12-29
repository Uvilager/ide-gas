import 'package:flutter/material.dart';
import 'package:frontend/models/grocery_model.dart';

import 'package:frontend/widgets/add_form_widget.dart';

class AddGroceryScreen extends StatelessWidget {
  const AddGroceryScreen({super.key, this.grocery, required this.title});

  final Grocery? grocery;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: AddGroceryWidget(title: title, id: grocery?.id),
    );
  }
}
