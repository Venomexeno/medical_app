import 'package:flutter/material.dart';
import 'package:medical_app/features/auth/presentation/widgets/text_field_container_widget.dart';
import 'package:medical_app/features/auth/presentation/widgets/text_field_password_container_widget.dart';

class SignUpFormSection extends StatefulWidget {
  const SignUpFormSection({
    super.key,
    required this.formKey,
  });

  final GlobalKey<FormState> formKey;

  @override
  State<SignUpFormSection> createState() => _SignUpFormSectionState();
}

class _SignUpFormSectionState extends State<SignUpFormSection> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
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
                return 'Please Enter your name';
              }
              return null;
            },
            hintText: 'Enter your name',
            controller: _usernameController,
            semanticsLabel: 'Name',
            prefixIcon: 'assets/icons/User.svg',
            textInputType: TextInputType.text,
          ),
          const SizedBox(height: 16),
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
            hintText: 'Enter your email',
            controller: _emailController,
            semanticsLabel: 'Email',
            prefixIcon: 'assets/icons/Email.svg',
            textInputType: TextInputType.text,
          ),
          const SizedBox(height: 16),
          TextFieldPasswordContainerWidget(
            validator: (String? value) {
              if (value!.isEmpty) {
                return 'Please Enter a Password';
              }
              if (value.length < 4) {
                return 'Password must contain 4 characters at least';
              }
              return null;
            },
            semanticsLabel: 'Password',
            controller: _passwordController,
            hintText: 'Enter your password',
          ),
        ],
      ),
    );
  }
}
