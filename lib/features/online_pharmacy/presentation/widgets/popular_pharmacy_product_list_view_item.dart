import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_app/core/constants/app_colors.dart';
import 'package:text_scroll/text_scroll.dart';

class PopularPharmacyProductListViewItem extends StatelessWidget {
  const PopularPharmacyProductListViewItem({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.component,
    required this.price,
  });

  final String imageUrl;
  final String title;
  final String component;
  final double price;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(6),
      width: 152.w,
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '$price LE',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13.sp),
              ),
              IconButton(
                padding: const EdgeInsets.all(0.0),
                onPressed: () {},
                icon: const Icon(
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
