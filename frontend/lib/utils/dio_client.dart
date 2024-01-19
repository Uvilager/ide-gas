import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/features/auth/data/auth_repository.dart';

final dioProvider = Provider<Dio>((ref) {
  final user = ref.watch(authNotifierProvider);

  return Dio(
    BaseOptions(
      baseUrl: 'http://192.168.100.29:3000/',
      connectTimeout: const Duration(seconds: 3),
      receiveTimeout: const Duration(seconds: 3),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${user.value!.accessToken}'
      },
    ),
  );
});
