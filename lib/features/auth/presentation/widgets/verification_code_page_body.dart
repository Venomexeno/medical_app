import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_app/core/constants/app_colors.dart';
import 'package:medical_app/core/constants/app_routers.dart';
import 'package:medical_app/features/auth/presentation/widgets/auth_button_widget.dart';

class VerificationCodePageBody extends StatelessWidget {
  const VerificationCodePageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Enter Verification Code',
            style: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Enter code that we have sent to your number',
            style: TextStyle(
              color: const Color(0xffA1A8B0),
              fontSize: 16.sp,
            ),
          ),
          const SizedBox(height: 32),
          Container(
            height: 32.h,
          ),
          const SizedBox(height: 40),
          AuthButtonWidget(text: 'Verify', onPressed: () {
            Navigator.pushNamed(context, AppRoutes.createNewPasswordPageRoute);
          }),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Didn’t receive the code?',
                style: TextStyle(
                  fontSize: 14.sp,
                  color: AppColors.grey,
                ),
              ),
              TextButton(
                child: Text(
                  'Resend',
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: AppColors.green,
                  ),
                ),
                onPressed: () {},
              )
            ],
          ),
        ],
      ),
    );
  }
}
