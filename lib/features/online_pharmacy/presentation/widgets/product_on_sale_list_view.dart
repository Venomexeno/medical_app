import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_app/features/online_pharmacy/presentation/widgets/product_on_sale_list_view_item.dart';

class ProductOnSaleListView extends StatelessWidget {
  const ProductOnSaleListView({super.key});

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
          return const ProductOnSaleListViewItem(
            imageUrl: 'https://i.ibb.co/nrVY9CN/panadol.png',
            title: 'Panadol',
            component: '30pcs',
            originalPrice: 999,
            newPrice: 999,
          );
        },
      ),
    );
  }
}
