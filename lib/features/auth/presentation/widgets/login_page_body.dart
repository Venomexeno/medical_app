import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_app/core/constants/app_routers.dart';
import 'package:medical_app/core/widgets/custom_elevated_button.dart';
import 'package:medical_app/features/auth/presentation/widgets/forgot_password_text_button_widget.dart';
import 'package:medical_app/features/auth/presentation/widgets/login_form_section.dart';
import 'package:medical_app/features/auth/presentation/widgets/sign_up_text_button_widget.dart';
import 'package:medical_app/features/auth/presentation/widgets/social_sign_in_widget.dart';

class LoginPageBody extends StatelessWidget {
  LoginPageBody({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            LoginFormSection(formKey: _formKey),
            const ForgotPasswordTextButtonWidget(),
            const SizedBox(height: 32),
            CustomElevatedButton(
              text: 'Login',
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  Navigator.pushReplacementNamed(
                      context, AppRoutes.homePageRoute);
                } else {
                  print("UnSuccessful");
                }
              },
            ),
            const SizedBox(height: 24),
            const SignUpTextButtonWidget(),
            Row(
              children: [
                const Expanded(
                  child: Divider(
                    endIndent: 20,
                    height: 20,
                    thickness: 2,
                    color: Color(0xffE5E7EB),
                  ),
                ),
                Text(
                  'OR',
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: const Color(
                      0xffA1A8B0,
                    ),
                  ),
                ),
                const Expanded(
                  child: Divider(
                    indent: 20,
                    height: 20,
                    thickness: 2,
                    color: Color(0xffE5E7EB),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            SocialSignInWidget(
              onPressed: () {
                Navigator.pushReplacementNamed(
                    context, AppRoutes.homePageRoute);
              },
              text: 'Sign in with Google',
              icon: 'assets/icons/Google.svg',
            ),
            const SizedBox(height: 16),
            SocialSignInWidget(
              onPressed: () {
                Navigator.pushReplacementNamed(
                    context, AppRoutes.homePageRoute);
              },
              text: 'Sign in with Facebook',
              icon: 'assets/icons/Facebook.svg',
            ),
          ],
        ),
      ),
    );
  }
}
