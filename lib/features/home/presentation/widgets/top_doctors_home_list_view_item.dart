import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_app/core/constants/app_routers.dart';
import 'package:medical_app/features/home/domain/entities/home_top_doctor_entity.dart';
import 'package:medical_app/features/home/presentation/widgets/rating_container.dart';
import 'package:text_scroll/text_scroll.dart';

class TopDoctorsHomeListViewItem extends StatelessWidget {
  const TopDoctorsHomeListViewItem({
    super.key,
    required this.homeTopDoctorEntity,
  });

  final HomeTopDoctorEntity homeTopDoctorEntity;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print(homeTopDoctorEntity.uidEntity);
        Navigator.pushNamed(context, AppRoutes.doctorDetailPageRoute);
      },
      child: Container(
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
            CachedNetworkImage(
              imageUrl: homeTopDoctorEntity.imageUrlEntity,
              imageBuilder: (context, imageProvider) => Container(
                width: 75.w,
                height: 75.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image:
                      DecorationImage(image: imageProvider, fit: BoxFit.cover),
                ),
              ),
            ),
            const SizedBox(height: 18),
            Align(
              alignment: Alignment.centerLeft,
              child: TextScroll(
                delayBefore: const Duration(seconds: 3),
                velocity: const Velocity(pixelsPerSecond: Offset(50, 0)),
                mode: TextScrollMode.bouncing,
                pauseBetween: const Duration(seconds: 5),
                'Dr. ${homeTopDoctorEntity.nameEntity}',
                style: TextStyle(
                  fontSize: 14.sp,
                  color: const Color(0xff555555),
                ),
              ),
            ),
            const SizedBox(height: 3),
            Align(
              alignment: Alignment.centerLeft,
              child: TextScroll(
                delayBefore: const Duration(seconds: 3),
                velocity: const Velocity(pixelsPerSecond: Offset(50, 0)),
                mode: TextScrollMode.bouncing,
                pauseBetween: const Duration(seconds: 5),
                homeTopDoctorEntity.specializationEntity,
                style: TextStyle(
                  fontSize: 11.sp,
                  color: const Color(0xffADADAD),
                ),
              ),
            ),
            const SizedBox(height: 10),
            RatingContainer(rating: homeTopDoctorEntity.ratingEntity),
          ],
        ),
      ),
    );
  }
}
