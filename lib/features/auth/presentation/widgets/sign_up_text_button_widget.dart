import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_app/core/constants/app_colors.dart';
import 'package:medical_app/core/constants/app_routers.dart';

class SignUpTextButtonWidget extends StatelessWidget {
  const SignUpTextButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Don’t have an account?',
          style: TextStyle(
            fontSize: 14.sp,
            shadows: const [
              Shadow(
                offset: Offset(0, 4),
                blurRadius: 14,
                color: AppColors.grey,
              )
            ],
            color: AppColors.grey,
          ),
        ),
        TextButton(
          child: Text('Sign Up',
              style: TextStyle(
                fontSize: 14.sp,
                shadows: const [
                  Shadow(
                    offset: Offset(0, 5),
                    blurRadius: 14,
                    color: AppColors.grey,
                  )
                ],
                color: AppColors.green,
              )),
          onPressed: () {
            Navigator.pushNamed(context, AppRoutes.signUpPageRoute);
          },
        )
      ],
    );
  }
}
