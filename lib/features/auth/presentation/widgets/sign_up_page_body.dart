import 'package:flutter/material.dart';
import 'package:medical_app/features/auth/presentation/widgets/login_text_button_widget.dart';
import 'package:medical_app/features/auth/presentation/widgets/sign_up_form_section.dart';
import 'package:medical_app/features/auth/presentation/widgets/success_dialog_widget.dart';

import 'auth_button_widget.dart';

class SignUpPageBody extends StatelessWidget {
  SignUpPageBody({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            SignUpFormSection(formKey: _formKey),
            const SizedBox(height: 32),
            AuthButtonWidget(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return const SuccessDialogWidget(
                        text: 'Your account has been successfully registered',
                      );
                    },
                  );
                } else {
                  return;
                }
              },
              text: 'Sign Up',
            ),
            const LoginTextButtonWidget()
          ],
        ),
      ),
    );
  }
}

