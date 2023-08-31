import 'package:flutter/material.dart';
import 'package:medical_app/features/doctor_consultation/presentation/widgets/doctor_detail_page_body.dart';

class DoctorDetailPage extends StatelessWidget {
  const DoctorDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: DoctorDetailPageBody(),
    );
  }
}
