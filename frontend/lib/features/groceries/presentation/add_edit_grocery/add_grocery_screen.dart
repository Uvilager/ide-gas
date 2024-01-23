import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:frontend/features/groceries/presentation/add_edit_grocery/add_form_widget.dart';

class AddGroceryScreen extends ConsumerWidget {
  const AddGroceryScreen({super.key, this.id, required this.title});

  final String? id;
  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: AddGroceryWidget(title: title, id: id),
    );
  }
}
