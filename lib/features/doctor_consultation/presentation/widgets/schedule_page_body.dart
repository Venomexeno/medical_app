import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_app/features/doctor_consultation/presentation/widgets/schedule_categories_section.dart';

class SchedulePageBody extends StatelessWidget {
  const SchedulePageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Schedule',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 24.sp,
                  ),
                ),
                const SizedBox(height: 35),
                const ScheduleCategoriesSection(),
              ],
            ),
          ),
        )
      ],
    );
  }
}
