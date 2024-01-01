import 'package:autoscale_tabbarview/autoscale_tabbarview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_app/core/constants/app_colors.dart';
import 'package:medical_app/features/doctor_consultation/presentation/widgets/completed_schedule_list_view.dart';

import 'canceled_schedule_list_view.dart';
import 'upcoming_schedule_list_view.dart';

class ScheduleCategoriesSection extends StatefulWidget {
  const ScheduleCategoriesSection({
    super.key,
  });

  @override
  State<ScheduleCategoriesSection> createState() =>
      _ScheduleCategoriesSectionState();
}

class _ScheduleCategoriesSectionState extends State<ScheduleCategoriesSection>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(4.r),
          decoration: BoxDecoration(
            color: const Color(0xffE8F3F1),
            borderRadius: BorderRadius.circular(8.r),
          ),
          width: double.infinity,
          height: 60.h,
          child: TabBar(
            indicatorWeight: 0,
            indicator: BoxDecoration(
              color: AppColors.green,
              borderRadius: BorderRadius.circular(8.r),
            ),
            labelColor: AppColors.white,
            unselectedLabelColor: AppColors.black,
            controller: _tabController,
            tabs: [
              Tab(
                child: Text(
                  'Upcoming',
                  style: TextStyle(
                    fontSize: 14.sp,
                  ),
                ),
              ),
              Tab(
                child: Text(
                  'Completed',
                  style: TextStyle(
                    fontSize: 14.sp,
                  ),
                ),
              ),
              Tab(
                child: Text(
                  'Canceled',
                  style: TextStyle(
                    fontSize: 14.sp,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 15),
        AutoScaleTabBarView(
          controller: _tabController,
          physics: const NeverScrollableScrollPhysics(),
          children: const [
            UpcomingScheduleListView(),
            CompletedScheduleListView(),
            CanceledScheduleListView(),
          ],
        )
      ],
    );
  }
}
