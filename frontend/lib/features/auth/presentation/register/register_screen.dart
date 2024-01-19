import 'package:flutter/material.dart';

import 'package:frontend/features/auth/presentation/register/register_form_widget.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: RegisterForm(),
      ),
    );
  }
}
