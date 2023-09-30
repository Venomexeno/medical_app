import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppointmentDetailsRow extends StatelessWidget {
  const AppointmentDetailsRow({
    super.key,
    required this.assetsIcon,
    required this.details,
  });

  final String assetsIcon;
  final String details;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        UnconstrainedBox(
          child: SvgPicture.asset(
            assetsIcon,
            width: 50.w,
            height: 50.h,
          ),
        ),
        const SizedBox(width: 15),
        Text(
          details,
          style: TextStyle(
            fontSize: 13.sp,
            fontWeight: FontWeight.w600,
          ),
        )
      ],
    );
  }
}
