import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_app/core/constants/app_colors.dart';
import 'package:medical_app/core/constants/app_routers.dart';
import 'package:medical_app/core/widgets/payment_checkout_row_widget.dart';
import 'package:medical_app/core/widgets/payment_details_row_widget.dart';
import 'package:medical_app/core/widgets/payment_method_container_widget.dart';
import 'package:medical_app/features/online_pharmacy/presentation/widgets/cart_list_view.dart';

class MyCartPageBody extends StatelessWidget {
  const MyCartPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverAppBar(
          centerTitle: true,
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
            'My Cart',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 16.sp,
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CartLisView(),
                const SizedBox(height: 20),
                Text(
                  'Payment Detail',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 10),
                PaymentDetailsRowWidget(
                  title: 'Subtotal',
                  price: 25,
                  textStyle: TextStyle(
                    fontSize: 14.sp,
                    color: const Color(0xff555555),
                  ),
                ),
                const SizedBox(height: 8),
                PaymentDetailsRowWidget(
                  title: 'Taxes',
                  price: 1,
                  textStyle: TextStyle(
                    fontSize: 14.sp,
                    color: const Color(0xff555555),
                  ),
                ),
                const SizedBox(height: 8),
                PaymentDetailsRowWidget(
                  title: 'Total',
                  price: 25,
                  textStyle: TextStyle(
                    fontSize: 14.sp,
                    color: AppColors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 10),
                const Divider(),
                const SizedBox(height: 10),
                Text(
                  'Payment Detail',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 12),
                const PaymentMethodContainerWidget(),
                const SizedBox(height: 25),
                PaymentCheckoutRowWidget(
                  price: 61,
                  buttonText: 'Checkout',
                  dialogAssetsIcon:'assets/icons/Done.svg',
                  dialogTitleText:'Payment Success',
                  dialogDescriptionText:'Your payment has been successful, you can have a consultation session with your trusted doctor',
                  dialogButtonText:'Back to Home',
                  dialogOnPressed: (){
                    Navigator.of(context).pushReplacementNamed(AppRoutes.rootPageRoute);
                  },
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
