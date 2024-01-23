import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:frontend/features/auth/data/auth_repository.dart';
import 'package:frontend/features/groceries/presentation/add_edit_grocery/add_grocery_screen.dart';
import 'package:frontend/features/auth/presentation/register/register_screen.dart';
import 'package:frontend/features/groceries/presentation/groceries_screen.dart';
import 'package:frontend/features/auth/presentation/login/main_screen.dart';

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
              path: 'add',
              builder: (context, state) => const AddGroceryScreen(
                title: 'Add Grocery',
              ),
            ),
            GoRoute(
              path: ':id',
              builder: (context, state) => AddGroceryScreen(
                title: 'Edit Grocery',
                id: state.pathParameters['id'],
              ),
            ),
          ],
        ),
      ],
    );
  },
);
