import 'package:flutter/material.dart';

class AuthForm extends StatefulWidget {
  const AuthForm({
    super.key,
    required this.onSubmit,
    required this.emailLabel,
    required this.passwordLabel,
    this.nameLabel,
    this.nameHint = 'Your name',
    this.emailHint = 'your@email.com',
    this.passwordHint = 'Enter password',
    this.namePrefixIcon = const Icon(Icons.person),
    this.emailPrefixIcon = const Icon(Icons.email),
    this.passwordPrefixIcon = const Icon(Icons.lock),
    this.showSubmitButton = true,
    this.submitText = 'SUBMIT',
  });

  /// Required labels
  final String emailLabel;
  final String passwordLabel;

  /// Optional label (for register)
  final String? nameLabel;

  /// Hints
  final String nameHint;
  final String emailHint;
  final String passwordHint;

  /// Changeable icons
  final Widget namePrefixIcon;
  final Widget emailPrefixIcon;
  final Widget passwordPrefixIcon;

  /// Show submit button
  final bool showSubmitButton;
  final String submitText;

  /// callback
  final void Function({
    String? name,
    required String email,
    required String password,
  }) onSubmit;

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController _nameCtrl;
  late final TextEditingController _emailCtrl;
  late final TextEditingController _passwordCtrl;

  bool _obscurePassword = true;

  void _togglePassword() {
    setState(() => _obscurePassword = !_obscurePassword);
  }

  @override
  void initState() {
    super.initState();
    _nameCtrl = TextEditingController();
    _emailCtrl = TextEditingController();
    _passwordCtrl = TextEditingController();
  }

  @override
  void dispose() {
    _nameCtrl.dispose();
    _emailCtrl.dispose();
    _passwordCtrl.dispose();
    super.dispose();
  }

  void submit() {
    final ok = _formKey.currentState?.validate() ?? false;
    if (!ok) return;

    widget.onSubmit(
      name: widget.nameLabel != null ? _nameCtrl.text.trim() : null,
      email: _emailCtrl.text.trim(),
      password: _passwordCtrl.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          if (widget.nameLabel != null) ...[
            _InputField(
              controller: _nameCtrl,
              label: widget.nameLabel!,
              hintText: widget.nameHint,
              prefixIcon: widget.namePrefixIcon,
              validator: (v) {
                if (v == null || v.trim().isEmpty) {
                  return 'Name is required';
                }
                return null;
              },
            ),
            const SizedBox(height: 12),
          ],

          _InputField(
            controller: _emailCtrl,
            label: widget.emailLabel,
            hintText: widget.emailHint,
            prefixIcon: widget.emailPrefixIcon,
            keyboardType: TextInputType.emailAddress,
            validator: (v) {
              final value = (v ?? '').trim();
              if (value.isEmpty) return 'Email is required';
              if (!value.contains('@') || !value.contains('.')) {
                return 'Enter a valid email';
              }
              return null;
            },
          ),
          const SizedBox(height: 12),

          _InputField(
            controller: _passwordCtrl,
            label: widget.passwordLabel,
            hintText: widget.passwordHint,
            prefixIcon: widget.passwordPrefixIcon,
            obscureText: _obscurePassword,
            validator: (v) {
              final value = v ?? '';
              if (value.isEmpty) return 'Password is required';
              if (value.length < 6) {
                return 'Password must be 6+ chars';
              }
              return null;
            },
            suffixIcon: IconButton(
              onPressed: _togglePassword,
              icon: Icon(
                _obscurePassword
                    ? Icons.visibility_off
                    : Icons.visibility,
              ),
            ),
          ),

          if (widget.showSubmitButton) ...[
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                onPressed: submit,
                child: Text(widget.submitText),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _InputField extends StatelessWidget {
  const _InputField({
    required this.controller,
    required this.label,
    required this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.keyboardType,
    this.validator,
    this.obscureText = false,
  });

  final TextEditingController controller;
  final String label;
  final String hintText;

  final Widget? prefixIcon;
  final Widget? suffixIcon;

  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      validator: validator,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: label,
        hintText: hintText,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        border: const OutlineInputBorder(),
      ),
    );
  }
}