import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_app/core/constants/app_colors.dart';
import 'package:medical_app/features/auth/presentation/widgets/text_field_container_widget.dart';

class ForgotPasswordTabsFormSection extends StatefulWidget {
  const ForgotPasswordTabsFormSection({
    super.key,
    required this.formKey,
  });

  final GlobalKey<FormState> formKey;

  @override
  State<ForgotPasswordTabsFormSection> createState() =>
      _ForgotPasswordTabsFormSectionState();
}

class _ForgotPasswordTabsFormSectionState
    extends State<ForgotPasswordTabsFormSection>
    with SingleTickerProviderStateMixin {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  late final TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _phoneController.dispose();
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: const Color(0xffF9FAFB),
            borderRadius: BorderRadius.circular(100.r),
          ),
          width: double.infinity,
          height: 60.h,
          child: TabBar(
            indicatorWeight: 0,
            indicator: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(100.r),
            ),
            labelColor: AppColors.green,
            unselectedLabelColor: const Color(0xffA1A8B0),
            controller: _tabController,
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
          width: double.infinity,
          height: 90.h,
          child: Form(
            key: widget.formKey,
            child: TabBarView(
              controller: _tabController,
              children: [
                TextFieldContainerWidget(
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return 'Please Enter an Email';
                    }
                    if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                        .hasMatch(value)) {
                      return 'Please a valid Email';
                    } else {
                      return null;
                    }
                  },
                  controller: _emailController,
                  hintText: 'Enter your email',
                  prefixIcon: 'assets/icons/Email.svg',
                  semanticsLabel: 'Email',
                  textInputType: TextInputType.emailAddress,
                ),
                TextFieldContainerWidget(
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return 'Please Enter Phone No';
                    }
                    if (value.length != 11) {
                      return 'Please Enter Valid Phone No';
                    } else {
                      return null;
                    }
                  },
                  controller: _phoneController,
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
