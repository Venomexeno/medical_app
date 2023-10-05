import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_app/core/constants/app_routers.dart';
import 'package:medical_app/core/widgets/custom_alert_dialog_widget.dart';
import 'package:medical_app/core/widgets/custom_elevated_button_widget.dart';
import 'package:medical_app/features/auth/presentation/widgets/create_password_form_section.dart';

class CreateNewPasswordPageBody extends StatelessWidget {
  CreateNewPasswordPageBody({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
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
            CreatePasswordFormSection(formKey: _formKey),
            const SizedBox(height: 24),
            CustomElevatedButtonWidget(
              text: 'Create Password',
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return CustomAlertDialogWidget(
                        titleText: 'Success',
                        descriptionText:
                            'You have successfully reset your password.',
                        buttonText: 'Login',
                        onPressed: () {
                          Navigator.pushNamedAndRemoveUntil(context,
                              AppRoutes.loginPageRoute, (route) => false);
                        },
                      );
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
