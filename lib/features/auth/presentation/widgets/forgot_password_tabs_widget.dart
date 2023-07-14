import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_app/core/constants/app_colors.dart';
import 'package:medical_app/features/auth/presentation/widgets/text_field_container_widget.dart';

class ForgotPasswordTabsWidget extends StatefulWidget {
  const ForgotPasswordTabsWidget({
    super.key,
    required this.formkey,
  });

  final GlobalKey<FormState> formkey;

  @override
  State<ForgotPasswordTabsWidget> createState() =>
      _ForgotPasswordTabsWidgetState();
}

class _ForgotPasswordTabsWidgetState extends State<ForgotPasswordTabsWidget>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final TabController tabController = TabController(length: 2, vsync: this);
    final TextEditingController emailController = TextEditingController();
    final TextEditingController phoneController = TextEditingController();

    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: const Color(0xffF9FAFB),
            borderRadius: BorderRadius.circular(100.r),
          ),
          width: MediaQuery.of(context).size.width,
          height: 60.h,
          child: TabBar(
            indicatorWeight: 0,
            indicator: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(100.r),
            ),
            labelColor: AppColors.green,
            unselectedLabelColor: const Color(0xffA1A8B0),
            controller: tabController,
            tabs: [
              Tab(
                child: Text(
                  'Email',
                  style: TextStyle(
                    fontSize: 14.sp,
                  ),
                ),
              ),
              Tab(
                child: Text(
                  'Phone',
                  style: TextStyle(
                    fontSize: 14.sp,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 65.h,
          child: Form(
            key: widget.formkey,
            child: TabBarView(
              controller: tabController,
              children: [
                TextFieldContainerWidget(
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return 'Please Enter an Email';
                    } if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                        .hasMatch(value)) {
                      return 'Please a valid Email';
                    } else {
                      return null;
                    }
                  },
                  controller: emailController,
                  hintText: 'Enter your email',
                  prefixIcon: 'assets/icons/Email.svg',
                  semanticsLabel: 'Email',
                  textInputType: TextInputType.emailAddress,
                ),
                TextFieldContainerWidget(
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return 'Please Enter Phone No';
                    } if (value.length != 11) {
                      return 'Please Enter Valid Phone No';
                    } else {
                      return null;
                    }
                  },
                  controller: phoneController,
                  hintText: 'Enter your phone number',
                  prefixIcon: 'assets/icons/Phone.svg',
                  semanticsLabel: 'Phone',
                  textInputType: TextInputType.phone,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
