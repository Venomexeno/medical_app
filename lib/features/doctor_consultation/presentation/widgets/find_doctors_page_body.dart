import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_app/features/doctor_consultation/presentation/widgets/recent_docotors_list_view.dart';
import 'package:medical_app/features/doctor_consultation/presentation/widgets/recommended_doctors.dart';
import 'package:medical_app/features/home/presentation/widgets/menu_item_container.dart';
import 'package:medical_app/features/home/presentation/widgets/search_form_section.dart';

class FindDoctorsPageBody extends StatelessWidget {
  FindDoctorsPageBody({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),

      slivers: [
        SliverAppBar(
          iconTheme: const IconThemeData(color: Colors.black),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: Text(
            'Find Doctors',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 16.sp,
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SearchFormSection(
                  formKey: _formKey,
                  hintText: 'Find a doctor',
                  semanticsLabelText: 'Search for a doctor',
                ),
                const SizedBox(height: 25),
                Text(
                  'Category',
                  style:
                      TextStyle(fontWeight: FontWeight.w600, fontSize: 18.sp),
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MenuItemContainer(
                      onPressed: () {},
                      text: 'General',
                      icon: 'assets/icons/Doctor.svg',
                    ),
                    MenuItemContainer(
                      onPressed: () {},
                      text: 'Lungs',
                      icon: 'assets/icons/Lungs.svg',
                    ),
                    MenuItemContainer(
                      onPressed: () {},
                      text: 'Dentist',
                      icon: 'assets/icons/Dentist.svg',
                    ),
                    MenuItemContainer(
                      onPressed: () {},
                      text: 'Psychiatrist',
                      icon: 'assets/icons/Psychiatrist.svg',
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MenuItemContainer(
                      onPressed: () {},
                      text: 'General',
                      icon: 'assets/icons/Doctor.svg',
                    ),
                    MenuItemContainer(
                      onPressed: () {},
                      text: 'Lungs',
                      icon: 'assets/icons/Lungs.svg',
                    ),
                    MenuItemContainer(
                      onPressed: () {},
                      text: 'Dentist',
                      icon: 'assets/icons/Dentist.svg',
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                Text(
                  'Recommended Doctors',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16.sp,
                  ),
                ),
                const SizedBox(height: 12),
                const RecommendedDoctors(
                  name: 'Marcus Horizon',
                  distance: 700,
                  rating: '4.5',
                  specialization: 'Chardiologist',
                  imageUrl:
                      'https://i.ibb.co/m9zqbpW/pexels-cedric-fauntleroy-4270371.png',
                ),
                const SizedBox(height: 20),
                Text(
                  'Your Recent Doctors',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16.sp,
                  ),
                ),
                const SizedBox(height: 12),
                const RecentDoctorsListView(),
              ],
            ),
          ),
        )
      ],
    );
  }
}
