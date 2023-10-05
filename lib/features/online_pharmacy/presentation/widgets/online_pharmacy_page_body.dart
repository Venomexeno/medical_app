import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medical_app/core/widgets/custom_banner_container_widget.dart';
import 'package:medical_app/core/widgets/custom_search_form_widget.dart';
import 'package:medical_app/core/widgets/custom_section_row_widget.dart';
import 'package:medical_app/features/online_pharmacy/presentation/widgets/popular_pharmacy_product_list_view.dart';
import 'package:medical_app/features/online_pharmacy/presentation/widgets/product_on_sale_list_view.dart';


class OnlinePharmacyPageBody extends StatelessWidget {
  OnlinePharmacyPageBody({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverAppBar(
          centerTitle: true,
          actions: [
            IconButton(
              icon: SvgPicture.asset('assets/icons/Cart.svg'),
              onPressed: () {},
            ),
          ],
          leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios_new),
              onPressed: () {
                Navigator.pop(context);
              }),
          iconTheme: const IconThemeData(color: Colors.black),
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            'Pharmacy',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 16.sp,
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                CustomSearchFormWidget(
                  formKey: _formKey,
                  hintText: 'Search drugs, category...',
                  semanticsLabelText: 'Pharmacy Search',
                ),
                SizedBox(height: 20.h),
                const CustomBannerContainerWidget(
                    imageUrl: 'https://i.ibb.co/jzqJBPZ/CTA2.png'),
                const SizedBox(height: 25),
                CustomSectionRowWidget(
                  name: 'Popular Product',
                  onPressed: () {},
                ),
                const PopularPharmacyProductListView(),
                const SizedBox(height: 15),
                CustomSectionRowWidget(
                  name: 'Product on Sale',
                  onPressed: () {},
                ),
                const ProductOnSaleListView(),
              ],
            ),
          ),
        )
      ],
    );
  }
}

