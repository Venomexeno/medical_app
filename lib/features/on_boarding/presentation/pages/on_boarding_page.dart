import 'package:flutter/material.dart';
import 'package:medical_app/core/constants/app_routers.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        child: const Text("Press Me"),
        onPressed: () {
          Navigator.pushReplacementNamed(context, AppRoutes.loginPageRoute);
        },
      ),
    );
  }
}
