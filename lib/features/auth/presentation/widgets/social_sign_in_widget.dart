import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medical_app/core/constants/app_colors.dart';

class SocialSignInWidget extends StatelessWidget {
  const SocialSignInWidget({
    super.key,
    required this.text,
    required this.icon,
    required this.onPressed,
  });

  final String text;
  final String icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
          elevation: 0,
          backgroundColor: AppColors.white,
          foregroundColor: AppColors.black,
          minimumSize: Size.fromHeight(65.h),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40.r))),
      onPressed: onPressed,
      child: Row(
        children: [
          SvgPicture.asset(icon),
          Expanded(
            child: Align(
              alignment: Alignment.center,
              child: Text(text,style: const TextStyle(
                fontWeight: FontWeight.w700
              ),),
            ),
          ),
        ],
      ),
    );
  }
}
