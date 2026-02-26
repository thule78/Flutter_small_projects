

import 'package:flutter/material.dart';
import '../widgets/forms/auth_form.dart';

class AppD33 extends StatefulWidget {
  const AppD33({super.key});

  @override
  State<AppD33> createState() => _AppD33State();
}

class _AppD33State extends State<AppD33> {
  bool _acceptTerms = true;

  void _onRegisterSubmit({
    String? name,
    required String email,
    required String password,
  }) {
    if (!_acceptTerms) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please accept terms and condition.')),
      );
      return;
    }

  
    debugPrint('REGISTER: name=$name email=$email password=$password');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header (logo + subtitle)
              const SizedBox(height: 8),
              const Center(
                child: Column(
                  children: [
                    Text(
                      'tanam',
                      style: TextStyle(fontSize: 44, fontWeight: FontWeight.w900),
                    ),
                    SizedBox(height: 6),
                    Text(
                      'Grocery App',
                      style: TextStyle(fontSize: 16, color: Colors.black54),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 18),

              // Title + subtitle
              const Text(
                'Create your account',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.w900),
              ),
              const SizedBox(height: 8),
              const Text(
                'Lorem ipsum dolor sit amet',
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),

              const SizedBox(height: 18),

              // Reusable AuthForm 
              AuthForm(
                nameLabel: 'User name',
                emailLabel: 'Email',
                passwordLabel: 'Password',
                submitText: 'REGISTER',
                onSubmit: _onRegisterSubmit,
              ),

              const SizedBox(height: 14),

              // Terms row
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Checkbox(
                    value: _acceptTerms,
                    onChanged: (v) => setState(() => _acceptTerms = v ?? false),
                  ),
                  const Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Text.rich(
                        TextSpan(
                          text: 'By tapping “Sign Up” you accept our ',
                          children: [
                            TextSpan(
                              text: 'terms and condition',
                              style: TextStyle(fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 18),

              // Already have account
              const Center(
                child: Text(
                  'Already have account?',
                  style: TextStyle(color: Colors.black54),
                ),
              ),
              const SizedBox(height: 12),

              // Sign in button
              SizedBox(
                width: double.infinity,
                height: 52,
                child: OutlinedButton(
                  onPressed: () {
                   
                    debugPrint('Go to SIGN IN');
                  },
                  child: const Text('SIGN IN'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}