import 'package:flutter/material.dart';
import 'package:medical_app/features/online_pharmacy/presentation/widgets/my_cart_page_body.dart';

class MyCartPage extends StatelessWidget {
  const MyCartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: MyCartPageBody(),
    );
  }
}
