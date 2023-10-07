import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medical_app/core/constants/app_routers.dart';
import 'package:medical_app/features/home/presentation/widgets/rating_container.dart';
import 'package:text_scroll/text_scroll.dart';

class RecommendedDoctors extends StatelessWidget {
  const RecommendedDoctors({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.specialization,
    required this.rating,
    required this.distance,
  });

  final String imageUrl;
  final String name;
  final String specialization;
  final double rating;
  final int distance;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(AppRoutes.doctorDetailPageRoute);
      },
      child: Container(
        height: 150.h,
        width: double.infinity,
        padding: EdgeInsets.all(12.r),
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0xffE8F3F1)),
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15.r),
              child: CachedNetworkImage(
                imageUrl: imageUrl,
                imageBuilder: (context, imageProvider) => Container(
                  width: 110.w,
                  height: 110.h,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: imageProvider, fit: BoxFit.cover),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 18),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextScroll(
                      delayBefore: const Duration(seconds: 3),
                      velocity: const Velocity(pixelsPerSecond: Offset(50, 0)),
                      mode: TextScrollMode.bouncing,
                      pauseBetween: const Duration(seconds: 5),
                      'Dr. $name',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      specialization,
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: const Color(0xffADADAD),
                      ),
                    ),
                    const Spacer(),
                    const Divider(thickness: 1.5),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RatingContainer(rating: rating),
                        Row(
                          children: [
                            SvgPicture.asset('assets/icons/Location.svg'),
                            const SizedBox(width: 4),
                            Text(
                              '${distance}m away',
                              style: TextStyle(
                                fontSize: 12.sp,
                                color: const Color(0xffADADAD),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
