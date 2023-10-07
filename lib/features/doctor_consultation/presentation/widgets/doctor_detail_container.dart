import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_app/features/home/presentation/widgets/distance_row.dart';
import 'package:medical_app/features/home/presentation/widgets/rating_container.dart';

class DoctorDetailContainer extends StatelessWidget {
  const DoctorDetailContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      width: double.infinity,
      height: 180.h,
      child: Row(
        children: [
          CachedNetworkImage(
            fit: BoxFit.cover,
            imageUrl:
                'https://i.ibb.co/NLsLXZb/doctor2.jpg',
            imageBuilder: (context, imageProvider) => Container(
              height: double.infinity,
              width: 115.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Dr. Marcus Horizon',
                    style:
                        TextStyle(fontWeight: FontWeight.w600, fontSize: 16.sp),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Chardiologist',
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: const Color(0xffADADAD),
                    ),
                  ),
                  const Spacer(),
                  const RatingContainer(rating: 4.7),
                  const Spacer(),
                  const DistanceRow(distance: 800),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
