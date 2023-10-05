import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_app/features/online_pharmacy/presentation/widgets/popular_pharmacy_product_list_view_item.dart';

class PopularPharmacyProductListView extends StatelessWidget {
  const PopularPharmacyProductListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250.h,
      child: ListView.separated(
        itemCount: 4,
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => const SizedBox(width: 15),
        itemBuilder: (context, index) {
          return const PopularPharmacyProductListViewItem(
            imageUrl: 'https://i.ibb.co/nrVY9CN/panadol.png',
            title: 'Panadol',
            component: '20pcs',
            price: 14.55,
          );
        },
      ),
    );
  }
}
