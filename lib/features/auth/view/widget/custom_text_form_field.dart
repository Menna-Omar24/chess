import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_color.dart';

class CustomTextFormField extends StatefulWidget {
  final String labelText;
  final IconData prefixIcon;
  final bool suffixIcon;
  final bool obscureText;

  const CustomTextFormField({
    super.key,
    required this.labelText,
    required this.prefixIcon,
    this.obscureText = false,
    this.suffixIcon = false,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  late bool isObscure;

  @override
  void initState() {
    super.initState();
    isObscure = widget.obscureText;
  }

  void toggleVisibility() {
    setState(() {
      isObscure = !isObscure;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isObscure,
      decoration: InputDecoration(
        prefixIcon: Icon(
          widget.prefixIcon,
          color: AppColor.primary,
        ),
        suffixIcon: widget.suffixIcon
            ? InkWell(
          onTap: toggleVisibility,
          child: Icon(
            isObscure ? Icons.visibility_off : Icons.visibility,
            color: AppColor.primary,
          ),
        )
            : null,
        labelText: widget.labelText,
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColor.primary,
            width: 1.w,
          ),
          borderRadius: BorderRadius.circular(16.r),
        ),
      ),
    );
  }
}
