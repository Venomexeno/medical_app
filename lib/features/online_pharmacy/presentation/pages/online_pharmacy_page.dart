import 'package:flutter/material.dart';
import 'package:medical_app/features/online_pharmacy/presentation/widgets/online_pharmacy_page_body.dart';

class OnlinePharmacyPage extends StatelessWidget {
  const OnlinePharmacyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OnlinePharmacyPageBody(),
    );
  }
}
