import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TextFieldPasswordContainerWidget extends StatefulWidget {
  const TextFieldPasswordContainerWidget({
    super.key,
    required this.controller,
    required this.semanticsLabel,
    required this.hintText,
    this.validator,
  });

  final TextEditingController controller;
  final String semanticsLabel;
  final String hintText;
  final String? Function(String?)? validator;

  @override
  State<TextFieldPasswordContainerWidget> createState() =>
      _TextFieldPasswordContainerWidgetState();
}

class _TextFieldPasswordContainerWidgetState
    extends State<TextFieldPasswordContainerWidget> {
  bool isObscureText = true;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextFormField(
        validator: widget.validator,
        obscureText: isObscureText,
        keyboardType: TextInputType.visiblePassword,
        controller: widget.controller,
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
          hintText: widget.hintText,
          border: InputBorder.none,
          suffixIcon: InkWell(
              onTap: () {
                setState(() {
                  isObscureText = !isObscureText;
                });
              },
              child: Icon(
                  isObscureText ? Icons.visibility_off : Icons.visibility)),
          filled: true,
          fillColor: const Color(0xffE5E7EB),
          prefixIcon: Padding(
            padding: const EdgeInsets.only(left: 24.0,right: 24),
            child: UnconstrainedBox(
              child: SvgPicture.asset(
                width: 32.w,
                height: 32.h,
                'assets/icons/Password.svg',
                semanticsLabel: widget.semanticsLabel,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
