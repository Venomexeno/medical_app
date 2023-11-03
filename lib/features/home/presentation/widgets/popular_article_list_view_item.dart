import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_app/core/constants/app_colors.dart';

class PopularArticleListViewItem extends StatelessWidget {
  const PopularArticleListViewItem({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110.w,
      decoration: BoxDecoration(
        color: AppColors.green,
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Center(
        child: Text(
          title,
          style: TextStyle(
              color: AppColors.white,
              fontSize: 14.sp,
              fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
