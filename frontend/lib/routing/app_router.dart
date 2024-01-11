import 'package:frontend/screens/add_grocery_screen.dart';
import 'package:go_router/go_router.dart';

import 'package:frontend/screens/register_screen.dart';
import 'package:frontend/screens/groceries_screen.dart';
import 'package:frontend/screens/main_screen.dart';

final router = GoRouter(
  initialLocation: '/groceries',
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const MainScreen(),
      routes: [
        GoRoute(
          path: 'register',
          builder: (context, state) => const RegisterScreen(),
        )
      ],
    ),
    GoRoute(
      path: '/groceries',
      builder: (context, state) => const GroceriesScreen(),
      routes: [
        GoRoute(
          path: ':id',
          builder: (context, state) => const AddGroceryScreen(
            title: 'Edit Grocery',
          ),
        ),
        GoRoute(
          path: 'add',
          builder: (context, state) => const AddGroceryScreen(
            title: 'Add Grocery',
          ),
        )
      ],
    ),
  ],
);
