import 'package:flutter/material.dart';
import 'package:medical_app/features/auth/presentation/widgets/text_field_password_container_widget.dart';

class CreatePasswordFormSection extends StatefulWidget {
  const CreatePasswordFormSection({
    super.key,
    required this.formKey,
  });

  final GlobalKey<FormState> formKey;

  @override
  State<CreatePasswordFormSection> createState() =>
      _CreatePasswordFormSectionState();
}

class _CreatePasswordFormSectionState extends State<CreatePasswordFormSection> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordConfirmationController =
      TextEditingController();

  @override
  void dispose() {
    _passwordController.dispose();
    _passwordConfirmationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        children: [
          TextFieldPasswordContainerWidget(
            controller: _passwordController,
            hintText: 'Enter password',
            semanticsLabel: 'Password',
            validator: (String? value) {
              if (value!.isEmpty) {
                return 'Please re-enter password';
              } else if (value.length < 4) {
                return 'Password must contain 4 characters at least';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
          TextFieldPasswordContainerWidget(
            controller: _passwordConfirmationController,
            hintText: 'Confirm password',
            semanticsLabel: 'Confirm Password',
            validator: (String? value) {
              if (value!.isEmpty) {
                return 'Please re-enter password';
              }
              if (_passwordController.text !=
                  _passwordConfirmationController.text) {
                return 'Password does not match';
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}
