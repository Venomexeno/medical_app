import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_app/core/constants/app_colors.dart';

class TrendingArticleListViewItem extends StatelessWidget {
  const TrendingArticleListViewItem({
    super.key,
    required this.imageUrl,
    required this.relatedTitle,
    required this.title,
    required this.date,
  });

  final String imageUrl;
  final String relatedTitle;
  final String title;
  final String date;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130.w,
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xffE8F3F1)),
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(18.r),
      ),
      child: Padding(
        padding: EdgeInsets.all(8.r),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10.r),
              child: CachedNetworkImage(
                imageUrl: imageUrl,
                width: double.infinity,
                height: 100.h,
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(height: 8.h),
            Container(
              padding: EdgeInsets.all(4.r),
              decoration: BoxDecoration(
                  color: const Color(0xffE8F3F1),
                  borderRadius: BorderRadius.circular(2.r)),
              child: Text(
                relatedTitle,
                style: TextStyle(
                  color: AppColors.green,
                  fontSize: 10.sp,
                ),
              ),
            ),
            SizedBox(height: 4.h),
            Text(
              title,
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 4.h),
            Text(
              date,
              style: TextStyle(fontSize: 9.sp, color: const Color(0xffADADAD)),
            ),
          ],
        ),
      ),
    );
  }
}
