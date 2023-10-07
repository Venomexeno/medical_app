import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_app/features/home/presentation/widgets/top_doctors_home_list_view_item.dart';

class TopDoctorsHomeListView extends StatelessWidget {
  const TopDoctorsHomeListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220.h,
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        separatorBuilder: (context, index) => const SizedBox(width: 10),
        itemCount: 5,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return const TopDoctorsHomeListViewItem(
            imageUrl: 'https://i.ibb.co/NLsLXZb/doctor2.jpg',
            rating: 4.5,
            name: 'Marcus Horizon',
            specialization: 'Cardiologist',
          );
        },
      ),
    );
  }
}
