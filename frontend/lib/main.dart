import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/features/cart/data/local_cart_repository.dart';

import 'package:frontend/features/cart/data/sembast_cart_repository.dart';
import 'package:frontend/routing/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final localCartRepository = await SembastCartRepository.create();

  runApp(
    ProviderScope(
      overrides: [
        localCartRepositoryProvider.overrideWithValue(localCartRepository),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // TODO Migrate from HTTP to DIO and implement Interceptors for Error/Sucess Handling
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    // final user = ref.watch(authNotifierProvider);
    return MaterialApp.router(
      routerConfig: router,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: user.when(
      //   data: (user) {
      //     if (user != null) {
      //       return const GroceriesScreen();
      //     }
      //     return const MainScreen();
      //   },
      //   error: (error, stack) => Text(
      //     error.toString(),
      //   ),
      //   loading: () => const Center(
      //     child: CircularProgressIndicator(),
      //   ),
      // ),
    );
  }
}
