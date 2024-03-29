import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_app/core/constants/app_colors.dart';

class RatingContainer extends StatelessWidget {
  const RatingContainer({
    super.key,
    required this.rating,
  });

  final num rating;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 3.w),
      decoration: BoxDecoration(
        color: const Color(0xffE8F3F1),
        borderRadius: BorderRadius.circular(5.r),
      ),
      height: 25.h,
      width: 50.w,
      child: Padding(
        padding: EdgeInsets.all(2.r),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(Icons.star_rounded, color: AppColors.green, size: 17.sp),
            Text(rating.toString(), style: const TextStyle(color: AppColors.green)),
          ],
        ),
      ),
    );
  }
}
