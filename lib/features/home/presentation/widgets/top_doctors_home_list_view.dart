import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_app/features/home/domain/entities/home_top_doctor_entity.dart';
import 'package:medical_app/features/home/presentation/widgets/top_doctors_home_list_view_item.dart';

class TopDoctorsHomeListView extends StatelessWidget {
  const TopDoctorsHomeListView({
    super.key,
    required this.homeTopDoctorEntity,
  });

  final List<HomeTopDoctorEntity> homeTopDoctorEntity;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220.h,
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        separatorBuilder: (context, index) => const SizedBox(width: 10),
        itemCount: homeTopDoctorEntity.length <= 4 ? homeTopDoctorEntity.length : 5,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return TopDoctorsHomeListViewItem(
            homeTopDoctorEntity: homeTopDoctorEntity[index],
          );
        },
      ),
    );
  }
}
