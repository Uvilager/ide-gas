import 'dart:convert';
import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

import 'package:frontend/models/user_model.dart';

class AuthNotifier extends AsyncNotifier<User?> {
  @override
  FutureOr<User?> build() {
    return null;
  }

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

  Future<void> logout() async {
    state = const AsyncValue.data(null);
  }
}

final authNotifierProvider =
    AsyncNotifierProvider<AuthNotifier, User?>(() => AuthNotifier());
