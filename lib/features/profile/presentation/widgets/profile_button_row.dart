import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medical_app/core/constants/app_colors.dart';

class ProfileButtonRow extends StatelessWidget {
  const ProfileButtonRow({
    super.key,
    required this.text,
    required this.assetsIcon,
    required this.onPressed,
    this.textColor,
  });

  final String text;
  final String assetsIcon;
  final VoidCallback onPressed;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: SizedBox(
        height: MediaQuery.of(context).size.height * .0595,
        child: Row(
          children: [
            SvgPicture.asset(assetsIcon),
            const SizedBox(width: 14),
            Text(
              text,
              style: TextStyle(
                color: textColor ?? AppColors.black,
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            const Spacer(),
            const Icon(Icons.arrow_forward_ios),
          ],
        ),
      ),
    );
  }
}
