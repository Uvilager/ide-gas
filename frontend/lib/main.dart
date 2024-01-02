import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/providers/auth_repository.dart';

import 'package:frontend/screens/groceries_screen.dart';
import 'package:frontend/screens/main_screen.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authNotifierProvider);
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: user.when(
            data: (user) {
              if (user != null) {
                return const GroceriesScreen();
              }
              return const MainScreen();
            },
            error: (error, stack) => Text(
                  error.toString(),
                ),
            loading: () => const Center(
                  child: CircularProgressIndicator(),
                )));
  }
}
