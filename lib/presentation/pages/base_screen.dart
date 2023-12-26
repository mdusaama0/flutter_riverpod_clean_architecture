import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/routes/app_router.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/text_styles.dart';
import '../../core/utils/app_assets.dart';

class BaseScreen extends StatelessWidget {
  final String title;
  final Widget child;
  final bool showPopIcon;

  const BaseScreen({
    super.key,
    required this.title,
    required this.child,
    this.showPopIcon = true,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: Stack(
        children: [
          showPopIcon
              ? Positioned(
                  top: 40.h,
                  left: 20.w,
                  child: IconButton(
                    onPressed: () => AppRouter.back(),
                    icon: const Icon(
                      Icons.arrow_back_ios_new,
                      color: Colors.white,
                    ),
                  ),
                )
              : Container(),
          Positioned(
            right: 0,
            child: Image.asset(
              AppAssets.bgImage,
              height: 500.h,
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).viewInsets.bottom != 0 ? 180.h : 240.h,
            bottom: 0,
            left: 40.w,
            right: 0,
            child: Text(
              title,
              style: TextStyles.titleStyle,
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).viewInsets.bottom != 0 ? 240.h : 300.h,
            left: 0,
            right: 0,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: ClipRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(15.r),
                    ),
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                    child: child,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
