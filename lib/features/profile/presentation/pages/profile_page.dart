import 'package:flutter/material.dart';
import 'package:medical_app/features/profile/presentation/widgets/profile_page_body.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ProfilePageBody(),
    );
  }
}
