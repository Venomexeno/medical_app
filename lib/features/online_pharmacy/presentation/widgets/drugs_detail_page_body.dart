import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medical_app/core/constants/app_colors.dart';
import 'package:medical_app/core/constants/app_routers.dart';
import 'package:medical_app/core/widgets/custom_elevated_button_widget.dart';
import 'package:readmore/readmore.dart';

class DrugsDetailPageBody extends StatelessWidget {
  const DrugsDetailPageBody({super.key});

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
              onPressed: () {
                Navigator.of(context).pushNamed(AppRoutes.myCartPageRoute);
              },
            ),
          ],
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          iconTheme: const IconThemeData(color: Colors.black),
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            'Drugs Detail',
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.25,
                  child: Center(
                    child: CachedNetworkImage(
                      imageUrl: 'https://i.ibb.co/MsBspRw/drug.png',
                      imageBuilder: (context, imageProvider) => Container(
                        width: 100.w,
                        height: 100.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                              image: imageProvider, fit: BoxFit.cover),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 50),
                Text(
                  'OBH Combi',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 20.sp,
                  ),
                ),
                const SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '75ml',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xffADADAD),
                      ),
                    ),
                    const Icon(Icons.favorite),
                  ],
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    RatingBar.builder(
                      initialRating: 3,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemSize: 16.sp,
                      itemPadding: const EdgeInsets.only(right: 2.0),
                      itemBuilder: (context, index) => const Icon(
                        Icons.star,
                        color: AppColors.green,
                      ),
                      onRatingUpdate: (rating) {
                        print(rating);
                      },
                    ),
                    const SizedBox(width: 2),
                    Text(
                      '4.0',
                      style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColors.green),
                    ),
                  ],
                ),
                const SizedBox(height: 25),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Icon(
                        Icons.remove,
                        color: const Color(0xffADADAD),
                        size: 30.sp,
                      ),
                    ),
                    const SizedBox(width: 15),
                    Text(
                      '1',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 20.sp,
                      ),
                    ),
                    const SizedBox(width: 15),
                    GestureDetector(
                      onTap: () {},
                      child: Icon(
                        Icons.add_box,
                        color: AppColors.green,
                        size: 30.sp,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      '9.99 LE',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 24.sp,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Text(
                  'Description',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 5),
                ReadMoreText(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad ',
                  style: TextStyle(
                      fontSize: 12.sp, color: const Color(0xff717784)),
                  trimLines: 4,
                  lessStyle: TextStyle(fontSize: 12.sp, color: AppColors.green),
                  trimMode: TrimMode.Line,
                  trimCollapsedText: 'Read more',
                  trimExpandedText: 'Read less',
                  moreStyle: TextStyle(fontSize: 12.sp, color: AppColors.green),
                ),
                const SizedBox(height: 40),
                SizedBox(
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 60.h,
                        width: 60.w,
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: const Color(0xffE8F3F1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: GestureDetector(
                            onTap: (){
                              Navigator.of(context).pushNamed(AppRoutes.myCartPageRoute);
                            },
                            child: SvgPicture.asset(
                              'assets/icons/Cart.svg',
                              colorFilter: const ColorFilter.mode(
                                AppColors.green,
                                BlendMode.srcIn,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 15.w,
                      ),
                      Expanded(
                        child: CustomElevatedButtonWidget(
                          text: 'Buy Now',
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
