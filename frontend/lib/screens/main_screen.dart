import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main Screen'),
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
