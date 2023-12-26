import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hey_flutter_task/core/theme/text_styles.dart';
import 'package:hey_flutter_task/core/utils/app_strings.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final bool isObscure;
  final bool isSuffix;
  final VoidCallback? onTapSuffix;
  final TextInputType textInputType;
  final String? suffixIcon;
  final int maxLines;
  final bool readOnly;
  final VoidCallback? onTap;
  final void Function(String)? onChanged;
  final bool focus;

  const CustomTextField({
    super.key,
    this.controller,
    this.hintText,
    this.isObscure = false,
    this.isSuffix = false,
    this.onTapSuffix,
    this.textInputType = TextInputType.text,
    this.suffixIcon,
    this.maxLines = 1,
    this.readOnly = false,
    this.onTap,
    this.focus = false,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(
          color: Colors.transparent,
        ),
      ),
      height: maxLines > 1 ? null : 55.h,
      child: TextFormField(
        onTap: onTap,
        onChanged: onChanged,
        keyboardType: textInputType,
        enableSuggestions: false,
        autocorrect: false,
        readOnly: readOnly,
        controller: controller,
        textAlign: TextAlign.start,
        cursorColor: Colors.black,
        style: TextStyles.subTitleStyle.copyWith(color: Colors.black),
        obscureText: isObscure,
        maxLines: maxLines,
        decoration: InputDecoration(
          suffixIcon: isSuffix
              ? IconButton(
                  splashRadius: 25.r,
                  onPressed: onTapSuffix,
                  icon: Text(!isObscure ? AppStrings.hide : AppStrings.view))
              : null,
          border: InputBorder.none,
          contentPadding:
              EdgeInsets.only(left: 16.w, right: 16.w, top: 10.h, bottom: 10.h),
          labelText: hintText ?? '',
          labelStyle: TextStyles.hintTextStyle,
        ),
      ),
    );
  }
}
