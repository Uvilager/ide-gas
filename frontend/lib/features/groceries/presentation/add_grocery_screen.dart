import 'package:flutter/material.dart';

import 'package:frontend/features/groceries/presentation/add_form_widget.dart';

class AddGroceryScreen extends StatelessWidget {
  const AddGroceryScreen({super.key, this.id, required this.title});

  final String? id;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: AddGroceryWidget(title: title, id: id),
    );
  }
}
