import 'package:flutter/material.dart';
import 'package:medical_app/features/doctor_consultation/presentation/widgets/upcoming_schedule_list_view_item.dart';

class UpcomingScheduleListView extends StatelessWidget {
  const UpcomingScheduleListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      separatorBuilder: (context, index) => const SizedBox(height: 20),
      itemCount: 20,
      itemBuilder: (context, index) {
        return const UpcomingScheduleListViewItem(
          imageUrl:
              'https://i.ibb.co/m9zqbpW/pexels-cedric-fauntleroy-4270371.png',
          time: '10:00 AM',
          date: '6/10/2023',
          isConfirmed: false,
          name: 'Mohamed Mohamed',
          specialization: 'Cardiologist',
        );
      },
    );
  }
}
