import 'package:flutter/material.dart';
import 'package:medical_app/core/constants/app_routers.dart';

class ForgotPasswordTextButtonWidget extends StatelessWidget {
  const ForgotPasswordTextButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () {
          Navigator.pushNamed(context, AppRoutes.forgotPasswordPageRoute);
        },
        child: const Text(
          'Forgot Password?',
        ),
      ),
    );
  }
}
