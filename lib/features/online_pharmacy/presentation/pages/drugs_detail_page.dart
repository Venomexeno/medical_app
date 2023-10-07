import 'package:flutter/material.dart';
import 'package:medical_app/features/online_pharmacy/presentation/widgets/drugs_detail_page_body.dart';

class DrugsDetailPage extends StatelessWidget {
  const DrugsDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: DrugsDetailPageBody(),
    );
  }
}
