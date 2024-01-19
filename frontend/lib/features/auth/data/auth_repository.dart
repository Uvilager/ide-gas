import 'dart:convert';
import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

import 'package:frontend/features/auth/models/user_model.dart';

// Auth Notifier
class AuthNotifier extends AsyncNotifier<User?> {
  @override
  FutureOr<User?> build() {
    return null;
  }

  // Login user still in HTTP
  Future<void> login(String email, String password) async {
    try {
      final response = await http
          .post(Uri.parse('http://192.168.100.29:3000/auth/login'), body: {
        'email': email,
        'password': password,
      });
      if (response.statusCode == 201) {
        final user = User.fromMap(json.decode(response.body));
        state = AsyncValue.data(user);
      } else {
        throw Exception('Failed to load user');
      }
    } catch (e) {
      print(e);
    }
  }

  // Logout user still in HTTP
  Future<void> logout() async {
    state = const AsyncValue.data(null);
  }

  // Register user still in HTTP
  Future<void> register(String name, String email, String password) async {
    try {
      final response = await http
          .post(Uri.parse('http://192.168.100.29:3000/auth/register'), body: {
        'username': name,
        'email': email,
        'password': password,
      });
      if (response.statusCode == 201) {
        ref.read(authNotifierProvider.notifier).login(email, password);
      } else {
        throw Exception('Failed to load user');
      }
    } catch (e) {
      print(e);
    }
  }
}

// Auth Notifier Provider
final authNotifierProvider =
    AsyncNotifierProvider<AuthNotifier, User?>(() => AuthNotifier());
