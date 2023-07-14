import 'package:flutter/material.dart';
import 'package:medical_app/features/auth/presentation/widgets/text_field_container_widget.dart';
import 'package:medical_app/features/auth/presentation/widgets/text_field_password_container_widget.dart';

class LoginFormSection extends StatefulWidget {
  const LoginFormSection({
    super.key,
    required this.formKey,
  });

  final GlobalKey<FormState> formKey;

  @override
  State<LoginFormSection> createState() => _LoginFormSectionState();
}

class _LoginFormSectionState extends State<LoginFormSection> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        children: [
          TextFieldContainerWidget(
            validator: (String? value) {
              if (value!.isEmpty) {
                return 'Please Enter your email';
              }
              if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                  .hasMatch(value)) {
                return 'Please a valid Email';
              }
              return null;
            },
            prefixIcon: 'assets/icons/Email.svg',
            hintText: 'Enter your email',
            controller: _emailController,
            semanticsLabel: 'Email',
            textInputType: TextInputType.emailAddress,
          ),
          const SizedBox(height: 16),
          TextFieldPasswordContainerWidget(
            validator: (String? value) {
              if (value!.isEmpty) {
                return 'Please re-enter password';
              }
              if (value.length < 4) {
                return 'Password must contain 4 characters at least';
              }
              return null;
            },
            controller: _passwordController,
            semanticsLabel: 'Password',
            hintText: 'Enter your password',
          ),
        ],
      ),
    );
  }
}
