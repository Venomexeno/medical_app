import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_app/core/constants/app_routers.dart';
import 'package:medical_app/core/widgets/custom_elevated_button_widget.dart';
import 'package:medical_app/features/auth/presentation/widgets/forgot_password_tabs_form_section.dart';


class ForgotPasswordPageBody extends StatelessWidget {
  ForgotPasswordPageBody({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Forgot Your Password?',
              style: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Enter your email or your phone number, we will send you confirmation code',
              style: TextStyle(
                color: const Color(0xffA1A8B0),
                fontSize: 16.sp,
              ),
            ),
            const SizedBox(height: 24),
            ForgotPasswordTabsFormSection(formKey: _formKey),
            const SizedBox(height: 32),
            CustomElevatedButtonWidget(
              text: 'Reset Password',
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  Navigator.pushNamed(context, AppRoutes.verificationCodePageRoute);
                } else {
                  return;
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
