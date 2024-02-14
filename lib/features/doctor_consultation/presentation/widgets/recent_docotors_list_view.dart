import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_app/features/doctor_consultation/domain/entities/find_doctors_entites/recent_doctor_entity.dart';
import 'package:medical_app/features/doctor_consultation/presentation/widgets/recent_docotors_list_view_item.dart';

class RecentDoctorsListView extends StatelessWidget {
  const RecentDoctorsListView({
    super.key,
    required this.recentDoctors,
  });

  final List<RecentDoctorEntity> recentDoctors;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 115.h,
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return RecentDoctorsListViewItem(
            recentDoctor: recentDoctors[index],
          );
        },
        separatorBuilder: (context, index) => const SizedBox(width: 4),
        itemCount: recentDoctors.length,
      ),
    );
  }
}
