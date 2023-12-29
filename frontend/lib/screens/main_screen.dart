import 'package:flutter/material.dart';
import 'package:frontend/providers/grocery_repository.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});
  final repository = GroceryRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main Screen'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          repository.fetchGroceries();
        },
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) => const ListTile(
          title: Text('Name'),
          trailing: Text('Quantity'),
        ),
      ),
    );
  }
}
