import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_app/features/doctor_consultation/presentation/widgets/recent_docotors_list_view_item.dart';

class RecentDoctorsListView extends StatelessWidget {
  const RecentDoctorsListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 115.h,
      child: ListView.separated(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return const RecentDoctorsListViewItem(
              imageUrl:
                  'https://i.ibb.co/m9zqbpW/pexels-cedric-fauntleroy-4270371.png',
              name: 'Marcus',
            );
          },
          separatorBuilder: (context, index) => const SizedBox(width: 4),
          itemCount: 5),
    );
  }
}
