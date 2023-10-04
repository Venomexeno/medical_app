import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:text_scroll/text_scroll.dart';

class UpcomingScheduleListViewItem extends StatelessWidget {
  const UpcomingScheduleListViewItem({
    super.key,
    required this.name,
    required this.specialization,
    required this.date,
    required this.time,
    required this.isConfirmed,
    required this.imageUrl,
  });

  final String name;
  final String specialization;
  final String imageUrl;
  final String date;
  final String time;
  final bool isConfirmed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220.h,
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
                isConfirmed
                    ? const Icon(Icons.fiber_manual_record,
                        color: Color(0xff7BEB78), size: 10)
                    : const Icon(Icons.fiber_manual_record,
                        color: Colors.yellow, size: 10),
                const SizedBox(width: 3),
                isConfirmed ? const Text('Confirmed') : const Text('Pending'),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 60.h,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xffE8F3F1),
                      foregroundColor: const Color(0xff555555),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      elevation: 0,
                    ),
                    onPressed: () {},
                    child: Text(
                      'Cancel',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: SizedBox(
                  height: 60.h,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      elevation: 0,
                    ),
                    onPressed: () {},
                    child: Text(
                      'Reschedule',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
