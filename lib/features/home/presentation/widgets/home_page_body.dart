import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_app/core/constants/app_colors.dart';
import 'package:medical_app/features/home/presentation/widgets/menu_item_widget.dart';
import 'package:medical_app/features/home/presentation/widgets/search_form_section.dart';
import 'package:medical_app/features/home/presentation/widgets/top_doctors_list_view.dart';

class HomePageBody extends StatelessWidget {
  HomePageBody({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
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
            const SizedBox(height: 15),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.22,
              color: Colors.red,
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Top Doctors',
                  style:
                      TextStyle(fontWeight: FontWeight.w600, fontSize: 16.sp),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'See All',
                    style: TextStyle(fontSize: 14.sp),
                  ),
                )
              ],
            ),
            const TopDoctorsListView(),
          ],
        ),
      ),
    );
  }
}

