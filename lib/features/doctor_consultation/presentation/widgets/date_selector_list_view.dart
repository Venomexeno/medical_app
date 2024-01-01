import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_app/features/doctor_consultation/presentation/widgets/date_selector_list_view_item.dart';

class DateSelectorListView extends StatelessWidget {
  const DateSelectorListView({
    super.key,
    required this.startDate,
    required this.selectedDate,
  });

  final DateTime startDate;
  final DateTime selectedDate;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90.h,
      child: ListView.separated(
        separatorBuilder: (context, index) => const SizedBox(width: 15),
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: 7,
        itemBuilder: (context, index) {
          DateTime currentDate = startDate.add(Duration(days: index));
          bool isSelected = currentDate == selectedDate;

          return DateSelectorListViewItem(
            currentDate: currentDate,
            isSelected: isSelected,
          );
        },
      ),
    );
  }
}
