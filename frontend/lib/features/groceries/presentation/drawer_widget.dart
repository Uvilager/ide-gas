import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/features/auth/data/auth_repository.dart';

class DrawerWidget extends ConsumerWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'Groceries App',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            title: const Text('My Groceries'),
            onTap: () {
              // Navigate to the home screen
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text('Sign Out'),
            onTap: () {
              ref.read(authNotifierProvider.notifier).logout();
            },
          ),
        ],
      ),
    );
  }
}
