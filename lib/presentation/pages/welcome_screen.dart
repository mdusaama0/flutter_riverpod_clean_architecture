import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hey_flutter_task/core/routes/app_router.dart';
import 'package:hey_flutter_task/core/theme/app_colors.dart';
import 'package:hey_flutter_task/core/utils/app_extensions.dart';
import 'package:hey_flutter_task/core/theme/text_styles.dart';
import 'package:hey_flutter_task/core/utils/app_assets.dart';
import 'package:hey_flutter_task/core/utils/app_strings.dart';
import 'package:hey_flutter_task/presentation/pages/base_screen.dart';
import 'package:hey_flutter_task/presentation/pages/login_screen.dart';
import 'package:hey_flutter_task/presentation/pages/sign_up_screen.dart';
import 'package:hey_flutter_task/presentation/widgets/custom_text_field.dart';
import 'package:hey_flutter_task/presentation/widgets/primary_button.dart';
import 'package:hey_flutter_task/presentation/widgets/social_media_button.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class WelcomeScreen extends HookConsumerWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailController = useTextEditingController();
    return BaseScren(
      title: AppStrings.hi,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomTextField(
            controller: emailController,
            hintText: AppStrings.email,
          ),
          15.ph,
          PrimaryButton(
            onTap: () => AppRouter.push(const LoginScreen()),
            text: AppStrings.continueText,
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 15.h),
            child: Text(
              AppStrings.or,
              style: TextStyles.subTitleStyle,
            ),
          ),
          SocialMediaButton(
            onTap: () {},
            text: AppStrings.contWithFb,
            icon: AppAssets.fbIcon,
          ),
          15.ph,
          SocialMediaButton(
            onTap: () {},
            text: AppStrings.contWithGoogle,
            icon: AppAssets.googleIcon,
          ),
          15.ph,
          SocialMediaButton(
            onTap: () {},
            text: AppStrings.contWithApple,
            icon: AppAssets.appleIcon,
          ),
          15.ph,
          Row(
            children: [
              Text(
                AppStrings.dontHaveAccount,
                style: TextStyles.subTitleStyle,
              ),
              TextButton(
                onPressed: () => AppRouter.push(const SignuUpScreen()),
                child: Text(
                  AppStrings.signup,
                  style: TextStyles.btnTextStyle.copyWith(
                    color: AppColors.primaryColor,
                  ),
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.topLeft,
            child: TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
              ),
              child: Text(
                AppStrings.forgotPass,
                style: TextStyles.btnTextStyle.copyWith(
                  color: AppColors.primaryColor,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
