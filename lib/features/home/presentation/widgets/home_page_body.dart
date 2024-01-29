import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_app/core/constants/app_colors.dart';
import 'package:medical_app/core/constants/app_routers.dart';
import 'package:medical_app/core/widgets/custom_banner_container_widget.dart';
import 'package:medical_app/core/widgets/custom_search_form_widget.dart';
import 'package:medical_app/features/home/presentation/widgets/health_article_home_list_view.dart';
import 'package:medical_app/features/home/presentation/widgets/menu_item_container.dart';
import 'package:medical_app/core/widgets/custom_section_row_widget.dart';
import 'package:medical_app/features/home/presentation/widgets/top_doctors_home_list_view.dart';

class HomePageBody extends StatelessWidget {
  HomePageBody({super.key});

  final _formKey = GlobalKey<FormState>();

  final List<String> gridText = ['Doctor', 'Pharmacy', 'Hospital', 'Ambulance'];
  final List<String> gridIcon = [
    'assets/icons/Doctor.svg',
    'assets/icons/Pharmacy.svg',
    'assets/icons/Hospital.svg',
    'assets/icons/Ambulance.svg',
  ];
  final List<String> gridNav = [
    AppRoutes.findDoctorsPageRoute,
    AppRoutes.onlinePharmacyPageRoute,
    AppRoutes.findDoctorsPageRoute,
    AppRoutes.onlinePharmacyPageRoute,
  ];

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: Text(
                    'Find your desire health solution',
                    style: TextStyle(
                      color: AppColors.black,
                      fontSize: 22.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                CustomSearchFormWidget(
                  formKey: _formKey,
                  hintText: 'Search doctor, drugs,articles...',
                  semanticsLabelText: 'Search',
                ),
                const SizedBox(height: 20),
                GridView.builder(
                  itemCount: 4,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                  ),
                  itemBuilder: (context, index) {
                    return MenuItemContainer(
                      onPressed: () {
                        Navigator.pushNamed(context, gridNav[index]);
                      },
                      text: gridText[index],
                      icon: gridIcon[index],
                    );
                  },
                ),
                const CustomBannerContainerWidget(
                  imageUrl: 'https://i.ibb.co/1XW6tMT/CTA.png',
                ),
                const SizedBox(height: 5),
                CustomSectionRowWidget(
                  name: 'Top Doctors',
                  onPressed: () {
                    Navigator.pushNamed(context, AppRoutes.topDoctorsPageRoute);
                  },
                ),
                const TopDoctorsHomeListView(),
                const SizedBox(height: 15),
                CustomSectionRowWidget(
                  name: 'Health article',
                  onPressed: () {
                    Navigator.pushNamed(
                        context, AppRoutes.healthArticlePageRoute);
                  },
                ),
                const SizedBox(height: 5),
                const HealthArticleHomeListView(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
