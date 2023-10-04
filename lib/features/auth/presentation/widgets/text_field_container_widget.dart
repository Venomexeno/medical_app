import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TextFieldContainerWidget extends StatelessWidget {
  const TextFieldContainerWidget({
    super.key,
    required this.controller,
    required this.hintText,
    required this.prefixIcon,
    required this.semanticsLabel,
    required this.textInputType,
    this.validator,
  });

  final TextEditingController controller;
  final String hintText;
  final String prefixIcon;
  final String semanticsLabel;
  final TextInputType textInputType;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      keyboardType: textInputType,
      controller: controller,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              width: 1,
              color: Color(0xffE5E7EB),
            ),
            borderRadius: BorderRadius.circular(40.r)),
        errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              width: 1,
              color: Colors.red,
            ),
            borderRadius: BorderRadius.circular(40.r)),
        focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              width: 1,
              color: Colors.red,
            ),
            borderRadius: BorderRadius.circular(40.r)),
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              width: 1,
              color: Color(0xffE5E7EB),
            ),
            borderRadius: BorderRadius.circular(40.r)),
        filled: true,
        fillColor: const Color(0xffE5E7EB),
        hintText: hintText,
        border: InputBorder.none,
        prefixIcon: Padding(
          padding: const EdgeInsets.only(left: 24.0, right: 24),
          child: UnconstrainedBox(
            child: SvgPicture.asset(
              width: 32.w,
              height: 32.h,
              prefixIcon,
              semanticsLabel: semanticsLabel,
            ),
          ),
        ),
      ),
    );
  }
}
