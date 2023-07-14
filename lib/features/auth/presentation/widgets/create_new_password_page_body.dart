import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_app/features/auth/presentation/widgets/success_dialog_widget.dart';
import 'package:medical_app/features/auth/presentation/widgets/text_field_password_container_widget.dart';

import 'auth_button_widget.dart';

class CreateNewPasswordPageBody extends StatelessWidget {
  CreateNewPasswordPageBody({super.key});

  final _formKey = GlobalKey<FormState>();

  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordConfirmationController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Create New Password',
              style: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Create your new password to login',
              style: TextStyle(
                color: const Color(0xffA1A8B0),
                fontSize: 16.sp,
              ),
            ),
            const SizedBox(height: 24),
            Form(
              key: _formKey,
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
            ),
            const SizedBox(height: 24),
            AuthButtonWidget(
              text: 'Create Password',
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return const SuccessDialogWidget(
                          text: 'You have successfully reset your password.');
                    },
                  );
                } else {
                  print('Unsuccessful');
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
