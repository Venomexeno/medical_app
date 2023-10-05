import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_app/core/constants/app_colors.dart';
import 'package:medical_app/core/constants/app_routers.dart';
import 'package:medical_app/core/widgets/custom_banner_container_widget.dart';
import 'package:medical_app/core/widgets/custom_search_form_widget.dart';
import 'package:medical_app/features/home/presentation/widgets/health_article_list_view.dart';
import 'package:medical_app/features/home/presentation/widgets/menu_item_container.dart';
import 'package:medical_app/core/widgets/custom_section_row_widget.dart';
import 'package:medical_app/features/home/presentation/widgets/top_doctors_home_list_view.dart';

class HomePageBody extends StatelessWidget {
  HomePageBody({super.key});

  final _formKey = GlobalKey<FormState>();

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
                const SizedBox(height: 16),
                GridView.count(
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 4,
                  shrinkWrap: true,
                  children: [
                    MenuItemContainer(
                      onPressed: () {
                        Navigator.pushNamed(
                            context, AppRoutes.findDoctorsPageRoute);
                      },
                      text: 'Doctor',
                      icon: 'assets/icons/Doctor.svg',
                    ),
                    MenuItemContainer(
                      onPressed: () {
                        Navigator.of(context)
                            .pushNamed(AppRoutes.onlinePharmacyPageRoute);
                      },
                      text: 'Pharmacy',
                      icon: 'assets/icons/Pharmacy.svg',
                    ),
                    MenuItemContainer(
                      onPressed: () {},
                      text: 'Hospital',
                      icon: 'assets/icons/Hospital.svg',
                    ),
                    MenuItemContainer(
                      onPressed: () {},
                      text: 'Ambulance',
                      icon: 'assets/icons/Ambulance.svg',
                    ),
                  ],
                ),
                const SizedBox(height: 15),
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
                  onPressed: () {},
                ),
                const SizedBox(height: 5),
                const HealthArticleListView(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

