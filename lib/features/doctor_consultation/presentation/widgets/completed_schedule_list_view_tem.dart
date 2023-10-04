import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medical_app/core/constants/app_colors.dart';
import 'package:text_scroll/text_scroll.dart';

class CompletedScheduleListViewItem extends StatelessWidget {
  const CompletedScheduleListViewItem({
    super.key,
    required this.name,
    required this.specialization,
    required this.imageUrl,
    required this.date,
    required this.time,
  });

  final String name;
  final String specialization;
  final String imageUrl;
  final String date;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.h,
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xffE8F3F1)),
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(10.r),
      ),
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 180.w,
                    child: TextScroll(
                      delayBefore: const Duration(seconds: 3),
                      velocity: const Velocity(pixelsPerSecond: Offset(50, 0)),
                      mode: TextScrollMode.bouncing,
                      pauseBetween: const Duration(seconds: 5),
                      'Dr. $name',
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 180.w,
                    child: TextScroll(
                      delayBefore: const Duration(seconds: 3),
                      velocity: const Velocity(pixelsPerSecond: Offset(50, 0)),
                      mode: TextScrollMode.bouncing,
                      pauseBetween: const Duration(seconds: 5),
                      specialization,
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: const Color(0xffADADAD),
                      ),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              CachedNetworkImage(
                imageUrl: imageUrl,
                imageBuilder: (context, imageProvider) => Container(
                  width: 75.w,
                  height: 75.h,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: imageProvider, fit: BoxFit.cover),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(right: 40.0),
            child: Row(
              children: [
                SvgPicture.asset('assets/icons/Schedule Calendar.svg'),
                const SizedBox(width: 3),
                Text(date),
                const Spacer(),
                SvgPicture.asset('assets/icons/Time Circle.svg'),
                const SizedBox(width: 3),
                Text(time),
                const Spacer(),
                const SizedBox(width: 3),
                const Icon(Icons.fiber_manual_record,
                    color: AppColors.green, size: 10),
                const SizedBox(width: 3),

                const Text('Completed'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
