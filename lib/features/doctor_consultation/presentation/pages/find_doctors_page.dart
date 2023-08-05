import 'package:flutter/material.dart';
import 'package:medical_app/features/doctor_consultation/presentation/widgets/find_doctors_page_body.dart';

class FindDoctorsPage extends StatelessWidget {
  const FindDoctorsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FindDoctorsPageBody(),
    );
  }
}
