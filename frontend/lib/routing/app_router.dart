import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/providers/auth_repository.dart';
import 'package:frontend/screens/add_grocery_screen.dart';
import 'package:go_router/go_router.dart';

import 'package:frontend/screens/register_screen.dart';
import 'package:frontend/screens/groceries_screen.dart';
import 'package:frontend/screens/main_screen.dart';

final routerProvider = Provider<GoRouter>(
  (ref) {
    final user = ref.watch(authNotifierProvider);
    return GoRouter(
      redirect: (context, state) {
        if (user.value != null && state.uri.path == '/') {
          return '/groceries';
        }
        if (user.value == null && state.uri.path == '/groceries') {
          return '/';
        }
        return null;
      },
      initialLocation: '/',
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
  },
);
