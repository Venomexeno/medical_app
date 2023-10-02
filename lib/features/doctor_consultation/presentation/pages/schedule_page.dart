import 'package:flutter/material.dart';
import 'package:medical_app/features/doctor_consultation/presentation/widgets/schedule_page_body.dart';

class SchedulePage extends StatelessWidget {
  const SchedulePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SchedulePageBody(),
    );
  }
}
