import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hey_flutter_task/core/theme/app_colors.dart';

class TextStyles {
  static final hintTextStyle = TextStyle(
    fontFamily: 'Lato',
    fontSize: 15.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.hintTextColor,
  );

  static final btnTextStyle = TextStyle(
    fontFamily: 'Lato',
    fontSize: 15.sp,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );

  static final titleStyle = TextStyle(
    fontFamily: 'Lato',
    fontSize: 35.sp,
    fontWeight: FontWeight.w700,
    color: Colors.white,
  );

  static final subTitleStyle = TextStyle(
    fontFamily: 'Lato',
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    color: Colors.white,
  );
}
