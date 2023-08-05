import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_app/core/constants/app_colors.dart';

class RatingContainer extends StatelessWidget {
  const RatingContainer({
    super.key,
    required this.rating,
  });

  final String rating;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xffE8F3F1),
        borderRadius: BorderRadius.circular(5.r),
      ),
      height: 25.h,
      width: 40.w,
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(Icons.star_rounded, color: AppColors.green, size: 17.sp),
            Text(rating, style: const TextStyle(color: AppColors.green)),
          ],
        ),
      ),
    );
  }
}