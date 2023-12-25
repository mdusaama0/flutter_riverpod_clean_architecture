import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hey_flutter_task/core/theme/app_colors.dart';
import 'package:hey_flutter_task/core/theme/text_styles.dart';

class SocialMediaButton extends StatelessWidget {
  final VoidCallback onTap;
  final String text, icon;
  final bool loader, enabled;
  final Color? backgroundColor, textColor;
  final double height;
  final double width;

  const SocialMediaButton({
    super.key,
    required this.onTap,
    required this.text,
    this.loader = false,
    this.backgroundColor,
    this.textColor,
    this.height = 50,
    this.width = double.infinity,
    this.enabled = true,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: SizedBox(
        width: width,
        height: height.h,
        child: ElevatedButton(
          onPressed: enabled ? onTap : null,
          style: ElevatedButton.styleFrom(
            backgroundColor: enabled
                ? loader
                    ? Colors.white
                    : (backgroundColor ?? AppColors.socialButtonColor)
                : Colors.grey,
            elevation: 0,
          ),
          child: loader == true
              ? const SizedBox(
                  width: 30,
                  height: 30,
                  child: CircularProgressIndicator(
                    color: Colors.white,
                    strokeWidth: 4.0,
                  ),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      icon,
                      width: 25.h,
                      height: 25.h,
                    ),
                    // 15.pw,
                    Text(
                      text,
                      style: TextStyles.btnTextStyle.copyWith(
                        color: AppColors.bgColor,
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(
                      width: 25.h,
                      height: 25.h,
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
