import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_app/core/constants/app_colors.dart';
import 'package:medical_app/core/constants/app_routers.dart';
import 'package:medical_app/core/widgets/custom_elevated_button_widget.dart';
import 'package:medical_app/features/doctor_consultation/presentation/controller/doctor_detail_cubit/update_recent_doctor_cubit/update_recent_doctor_cubit.dart';
import 'package:medical_app/features/doctor_consultation/presentation/widgets/date_selector_list_view_bloc_builder.dart';
import 'package:medical_app/features/doctor_consultation/presentation/widgets/time_selector_grid_view_bloc_builder.dart';
import 'package:medical_app/features/doctor_consultation/presentation/widgets/doctor_detail_container.dart';
import 'package:readmore/readmore.dart';

class DoctorDetailPageBody extends StatelessWidget {
  const DoctorDetailPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    context
        .read<UpdateRecentDoctorCubit>()
        .updateRecentDoctors(userUid: 'Kx4AH6SvSsMNUH4DUHEv1mGHdC02', doctorUid: 'XV28Ivm0qV0LZc7jkQvS');
    return BlocBuilder<UpdateRecentDoctorCubit, UpdateRecentDoctorState>(
      builder: (context, state) {
        if (state is UpdateRecentDoctorSuccess) {
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
                  'Doctor Detail',
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
                      const DoctorDetailContainer(),
                      const SizedBox(height: 20),
                      Text(
                        'About',
                        style: TextStyle(
                            fontSize: 16.sp, fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(height: 8),
                      ReadMoreText(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad ',
                        style: TextStyle(
                            fontSize: 12.sp, color: const Color(0xff717784)),
                        trimLines: 3,
                        lessStyle:
                            TextStyle(fontSize: 12.sp, color: AppColors.green),
                        trimMode: TrimMode.Line,
                        trimCollapsedText: 'Read more',
                        trimExpandedText: 'Read less',
                        moreStyle:
                            TextStyle(fontSize: 12.sp, color: AppColors.green),
                      ),
                      const SizedBox(height: 25),
                      const DateSelectorListViewBlocBuilder(),
                      const SizedBox(height: 25),
                      const Divider(
                        thickness: 1.5,
                        color: Color(0xffE8F3F1),
                      ),
                      const TimeSelectorGridViewBlocBuilder(),
                      const SizedBox(height: 30),
                      SizedBox(
                          width: double.infinity,
                          child: CustomElevatedButtonWidget(
                            onPressed: () {
                              Navigator.pushNamed(context,
                                  AppRoutes.doctorAppointmentBookingPageRoute);
                            },
                            text: 'Book Appointment',
                          )),
                      const SizedBox(height: 5),
                    ],
                  ),
                ),
              ),
            ],
          );
        } else if (state is UpdateRecentDoctorFailure) {
          return Center(child: Text(state.errMessage));
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
