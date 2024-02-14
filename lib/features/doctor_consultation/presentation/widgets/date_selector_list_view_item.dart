import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:medical_app/core/constants/app_colors.dart';
import 'package:medical_app/features/doctor_consultation/presentation/controller/doctor_detail_cubit/date_selector_cubit/date_selector_cubit.dart';

class DateSelectorListViewItem extends StatelessWidget {
  const DateSelectorListViewItem({
    super.key,
    required this.currentDate,
    required this.isSelected,
  });

  final DateTime currentDate;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<DateSelectorCubit>().selectDate(currentDate);
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0xffE8F3F1)),
          borderRadius: BorderRadius.circular(20.r),
          color: isSelected ? AppColors.green : Colors.transparent,
        ),
        width: 50.w,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              DateFormat('EEE').format(currentDate),
              style: TextStyle(
                color: isSelected ? AppColors.white : AppColors.grey,
                  fontSize: 14.sp

              ),
            ),
            Text(
              '${currentDate.day}',
              style: TextStyle(
                color: isSelected ? AppColors.white : AppColors.black,
                fontWeight: FontWeight.bold,
                fontSize: 16.sp
              ),
            ),
          ],
        ),
      ),
    );
  }
}
