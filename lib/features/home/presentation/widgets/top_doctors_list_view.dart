import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_app/features/home/presentation/widgets/top_doctors_list_view_item.dart';

class TopDoctorsListView extends StatelessWidget {
  const TopDoctorsListView({
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
          return const TopDoctorsListViewItem(
            imageUrl: 'https://ezgif.com/save/ezgif-5-c9d3341648.png',
            rating: '4,7',
            name: 'Dr. Marcus Horizon',
            specialization: 'Cardiologist',
          );
        },
      ),
    );
  }
}
