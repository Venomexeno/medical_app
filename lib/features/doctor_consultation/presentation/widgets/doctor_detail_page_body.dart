import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_app/core/constants/app_colors.dart';
import 'package:medical_app/features/doctor_consultation/presentation/widgets/doctor_detail_container.dart';
import 'package:readmore/readmore.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';

class DoctorDetailPageBody extends StatelessWidget {
  const DoctorDetailPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          centerTitle: true,
          leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios_new),
              onPressed: () {
                Navigator.pop(context);
              }),
          iconTheme: const IconThemeData(color: Colors.black),
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            'Doctor Detail',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 16.sp,
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const DoctorDetailContainer(),
                const SizedBox(height: 20),
                Text(
                  'About',
                  style:
                      TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 8),
                ReadMoreText(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad ',
                  style: TextStyle(
                      fontSize: 12.sp, color: const Color(0xff717784)),
                  trimLines: 3,
                  lessStyle: TextStyle(fontSize: 12.sp, color: AppColors.green),
                  trimMode: TrimMode.Line,
                  trimCollapsedText: 'Read more',
                  trimExpandedText: 'Read less',
                  moreStyle: TextStyle(fontSize: 12.sp, color: AppColors.green),
                ),
                const SizedBox(height: 25),
                DatePicker(
                  DateTime.now(),
                  initialSelectedDate: DateTime.now(),
                  selectionColor: AppColors.green,
                  selectedTextColor: Colors.white,
                  daysCount: 7,
                  onDateChange: (date) {},
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
