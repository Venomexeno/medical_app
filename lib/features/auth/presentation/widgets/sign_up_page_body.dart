import 'package:flutter/material.dart';
import 'package:medical_app/core/constants/app_routers.dart';
import 'package:medical_app/core/widgets/custom_alert_dialog_widget.dart';
import 'package:medical_app/core/widgets/custom_elevated_button_widget.dart';
import 'package:medical_app/features/auth/presentation/widgets/login_text_button_widget.dart';
import 'package:medical_app/features/auth/presentation/widgets/sign_up_form_section.dart';

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
            CustomElevatedButtonWidget(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return CustomAlertDialogWidget(
                        assetsIcon: 'assets/icons/Done.svg',
                        titleText: 'Success',
                        descriptionText:
                            'Your account has been successfully registered.',
                        buttonText: 'Login',
                        onPressed: () {
                          Navigator.pushNamedAndRemoveUntil(context,
                              AppRoutes.loginPageRoute, (route) => false);
                        },
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
