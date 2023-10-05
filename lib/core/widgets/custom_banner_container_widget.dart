import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBannerContainerWidget extends StatelessWidget {
  const CustomBannerContainerWidget({
    super.key, required this.imageUrl,
  });

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15.r),
      child: CachedNetworkImage(
        fit: BoxFit.fill,
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.22,
        imageUrl: imageUrl,
      ),
    );
  }
}
