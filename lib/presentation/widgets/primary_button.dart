import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hey_flutter_task/core/theme/app_colors.dart';
import 'package:hey_flutter_task/core/theme/text_styles.dart';

class PrimaryButton extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  final bool loader, enabled;
  final Color? backgroundColor, textColor;
  final double height;
  final double width;

  const PrimaryButton({
    super.key,
    required this.onTap,
    required this.text,
    this.loader = false,
    this.backgroundColor,
    this.textColor,
    this.height = 50,
    this.width = double.infinity,
    this.enabled = true,
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
                ? (backgroundColor ?? AppColors.primaryColor)
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
              : Text(
                  text,
                  style: TextStyles.btnTextStyle,
                ),
        ),
      ),
    );
  }
}
