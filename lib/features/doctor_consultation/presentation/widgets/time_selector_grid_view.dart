import 'package:flutter/material.dart';
import 'package:medical_app/features/doctor_consultation/presentation/widgets/time_selector_grid_view_item.dart';

class TimeSelectorGridView extends StatelessWidget {
  const TimeSelectorGridView({
    super.key,
    required this.selectedTime,
  });

  final DateTime selectedTime;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: 2.5,
        crossAxisCount: 3,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
      ),
      itemCount: 9,
      itemBuilder: (context, index) {
        DateTime currentTime = DateTime(2024, 1, 1, 9, 0)
            .add(const Duration(hours: 1, minutes: 30) * index);

        bool isSelected = currentTime == selectedTime;

        return TimeSelectorGridViewItem(
          currentTime: currentTime,
          isSelected: isSelected,
        );
      },
    );
  }
}
