import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:text_scroll/text_scroll.dart';

import '../../../../core/constants/app_colors.dart';

class ProductOnSaleListViewItem extends StatelessWidget {
  const ProductOnSaleListViewItem({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.component,
    required this.originalPrice,
    required this.newPrice,
  });

  final String imageUrl;
  final String title;
  final String component;
  final double originalPrice;
  final double newPrice;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(6),
      width: 154.w,
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xffE8F3F1)),
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CachedNetworkImage(
            imageUrl: imageUrl,
            imageBuilder: (context, imageProvider) => Container(
              width: 100.w,
              height: 100.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
              ),
            ),
          ),
          const SizedBox(height: 18),
          Align(
            alignment: Alignment.centerLeft,
            child: TextScroll(
              delayBefore: const Duration(seconds: 3),
              velocity: const Velocity(pixelsPerSecond: Offset(50, 0)),
              mode: TextScrollMode.bouncing,
              pauseBetween: const Duration(seconds: 5),
              title,
              style: TextStyle(
                fontSize: 14.sp,
                color: AppColors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: TextScroll(
              delayBefore: const Duration(seconds: 3),
              velocity: const Velocity(pixelsPerSecond: Offset(50, 0)),
              mode: TextScrollMode.bouncing,
              pauseBetween: const Duration(seconds: 5),
              component,
              style: TextStyle(
                fontSize: 12.sp,
                color: const Color(0xffADADAD),
              ),
            ),
          ),
          const SizedBox(height: 5),
          Row(
            children: [
              Text(
                '$newPrice LE',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13.sp),
              ),
              const SizedBox(width: 2),
              Text(
                '$originalPrice LE',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 9.sp,
                  decoration: TextDecoration.lineThrough,
                  color: const Color(0xffADADAD),
                ),
              ),
              const Spacer(),
              IconButton(
                padding: EdgeInsets.zero,
                onPressed: () {},
                icon: Icon(
                  size: 24.sp,
                  Icons.add_box,
                  color: AppColors.green,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
