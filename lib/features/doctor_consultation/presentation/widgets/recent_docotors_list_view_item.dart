import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_app/core/constants/app_routers.dart';
import 'package:medical_app/features/doctor_consultation/domain/entities/find_doctors_entites/recent_doctor_entity.dart';

class RecentDoctorsListViewItem extends StatelessWidget {
  const RecentDoctorsListViewItem({
    super.key,
    required this.recentDoctor,
  });

  final RecentDoctorEntity recentDoctor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print(recentDoctor.uidEntity);
        Navigator.of(context).pushNamed(AppRoutes.doctorDetailPageRoute);
      },
      child: Column(
        children: [
          CachedNetworkImage(
            imageUrl: recentDoctor.imageUrlEntity,
            imageBuilder: (context, imageProvider) => Container(
              width: 80.w,
              height: 80.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Dr. ${recentDoctor.nameEntity}',
            style: TextStyle(
              fontSize: 10.sp,
            ),
          ),
        ],
      ),
    );
  }
}
