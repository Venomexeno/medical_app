import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medical_app/core/constants/app_colors.dart';
import 'package:medical_app/core/widgets/custom_alert_dialog_widget.dart';
import 'package:medical_app/core/widgets/custom_elevated_button_widget.dart';
import 'package:medical_app/features/doctor_consultation/presentation/widgets/appointment_details_row.dart';
import 'package:medical_app/features/doctor_consultation/presentation/widgets/appointment_doctor_details_container.dart';
import 'package:medical_app/features/doctor_consultation/presentation/widgets/appointment_title_row.dart';
import 'package:medical_app/features/doctor_consultation/presentation/widgets/payment_details_row.dart';

///TODO: onPressed Button Functions

class DoctorAppointmentBookingPageBody extends StatelessWidget {
  const DoctorAppointmentBookingPageBody({super.key});

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
              }),
          iconTheme: const IconThemeData(color: Colors.black),
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            'Appointment',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 16.sp,
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const AppointmentDoctorDetailsContainer(
                  imageUrl:
                      'https://i.ibb.co/m9zqbpW/pexels-cedric-fauntleroy-4270371.png',
                  name: 'Mohamed Ibrahim Elsaid',
                  specialization: 'Chardiologist',
                  rating: 4.5,
                  distance: 300,
                ),
                const SizedBox(height: 20),
                AppointmentTitleRow(
                  onPressed: () {},
                  title: 'Date',
                ),
                const AppointmentDetailsRow(
                  details: 'Wednesday, Jun 23, 2021 | 10:00 AM',
                  assetsIcon: 'assets/icons/Date.svg',
                ),
                const SizedBox(height: 10),
                const Divider(thickness: 1),
                const SizedBox(height: 5),
                AppointmentTitleRow(
                  onPressed: () {},
                  title: 'Reason',
                ),
                const AppointmentDetailsRow(
                  details: 'Chest Pain',
                  assetsIcon: 'assets/icons/Reason.svg',
                ),
                const SizedBox(height: 10),
                const Divider(thickness: 1),
                const SizedBox(height: 12),
                Text(
                  'Payment Detail',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 12),
                const PaymentDetailsRow(
                  title: 'Consultation',
                  price: 60,
                ),
                const SizedBox(height: 10),
                const PaymentDetailsRow(
                  title: 'Admin Fee',
                  price: 1,
                ),
                const SizedBox(height: 10),
                const PaymentDetailsRow(
                  title: 'Additional Discount',
                  price: 0,
                ),
                const SizedBox(height: 10),
                PaymentDetailsRow(
                  title: 'Total',
                  textStyle: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                  ),
                  price: 61,
                  priceTextColor: AppColors.green,
                ),
                const SizedBox(height: 12),
                const Divider(thickness: 1),
                const SizedBox(height: 12),
                Text(
                  'Payment Detail',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 12),
                Container(
                  width: double.infinity,
                  height: 60.h,
                  decoration: BoxDecoration(
                    border: Border.all(color: const Color(0xffE8F3F1)),
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SvgPicture.asset('assets/images/VISA.svg'),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'Change',
                          style: TextStyle(
                            color: const Color(0xffADADAD),
                            fontSize: 12.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Total',
                          style: TextStyle(
                            color: const Color(0xffA1A8B0),
                            fontSize: 14.sp,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          '61 LE',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: AppColors.black,
                            fontSize: 18.sp,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 60.w),
                    Expanded(
                      child: CustomElevatedButtonWidget(
                        text: 'Booking',
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return CustomAlertDialogWidget(
                                assetsIcon: 'assets/icons/Done.svg',
                                titleText: 'Payment Success',
                                descriptionText: 'Your payment has been successful, you can have a consultation session with your trusted doctor',
                                buttonText: 'Chat Doctor',
                                onPressed: (){},
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
