import 'package:flutter/material.dart';
import 'package:medical_app/features/home/presentation/widgets/top_doctors_page_body.dart';

class TopDoctorsPage extends StatelessWidget {
  const TopDoctorsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: TopDoctorsPageBody(),
    );
  }
}
