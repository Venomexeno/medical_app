import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_app/core/constants/app_colors.dart';
import 'package:medical_app/features/home/presentation/widgets/menu_item_widget.dart';
import 'package:medical_app/features/home/presentation/widgets/search_form_section.dart';

class HomePageBody extends StatelessWidget {
  HomePageBody({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.5,
            child: Text(
              'Find your desire healt solution',
              style: TextStyle(
                color: AppColors.black,
                fontSize: 22.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(height: 20),
          SearchFormSection(
            formKey: _formKey,
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MenuItemWidget(
                onPressed: () {},
                text: 'Doctor',
                icon: 'assets/icons/Doctor.svg',
              ),
              MenuItemWidget(
                onPressed: () {},
                text: 'Pharmacy',
                icon: 'assets/icons/Pharmacy.svg',
              ),
              MenuItemWidget(
                onPressed: () {},
                text: 'Hospital',
                icon: 'assets/icons/Hospital.svg',
              ),
              MenuItemWidget(
                onPressed: () {},
                text: 'Ambulance',
                icon: 'assets/icons/Ambulance.svg',
              ),

            ],
          ),
        ],
      ),
    );
  }
}
