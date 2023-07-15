import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_app/core/constants/app_colors.dart';

class TopDoctorsListViewItem extends StatelessWidget {
  const TopDoctorsListViewItem({
    super.key,
    required this.name,
    required this.specialization,
    required this.rating,
    required this.imageUrl,
  });

  final String imageUrl;
  final String name;
  final String specialization;
  final String rating;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      width: 100.w,
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xffE8F3F1)),
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 75.h,
            width: 75.h,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(imageUrl), fit: BoxFit.cover),
                shape: BoxShape.circle),
          ),
          const SizedBox(height: 18),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              name,
              maxLines: 1,
              style: TextStyle(
                fontSize: 14.sp,
                color: const Color(0xff555555),
              ),
            ),
          ),
          const SizedBox(height: 3),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
             specialization,
              maxLines: 1,
              style: TextStyle(
                fontSize: 11.sp,
                color: const Color(0xffADADAD),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Container(
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
          ),
        ],
      ),
    );
  }
}
