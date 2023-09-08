import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_app/core/constants/app_colors.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.r)),
          minimumSize: Size.fromHeight(65.h)),
      onPressed: onPressed,
      child: Text(
        text,
        style: const TextStyle(
            color: AppColors.white, fontWeight: FontWeight.w600),
      ),
    );
  }
}
