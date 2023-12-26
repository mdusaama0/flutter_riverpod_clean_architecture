import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hey_flutter_task/core/theme/app_colors.dart';
import 'package:hey_flutter_task/core/utils/app_extensions.dart';
import 'package:hey_flutter_task/core/theme/text_styles.dart';
import 'package:hey_flutter_task/core/utils/app_assets.dart';
import 'package:hey_flutter_task/core/utils/app_prompts.dart';
import 'package:hey_flutter_task/core/utils/app_strings.dart';
import 'package:hey_flutter_task/core/utils/app_validators.dart';
import 'package:hey_flutter_task/presentation/pages/base_screen.dart';
import 'package:hey_flutter_task/presentation/providers/auth_provider.dart';
import 'package:hey_flutter_task/presentation/widgets/custom_text_field.dart';
import 'package:hey_flutter_task/presentation/widgets/primary_button.dart';
import 'package:hey_flutter_task/presentation/widgets/social_media_button.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

//using the hook consumer widget for both riverpod and hooks combination
class WelcomeScreen extends HookConsumerWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //text editing controller hook to dispose it automatically
    final emailController = useTextEditingController();
    var provider = ref.watch(authProvider); //auth provider class instance

    onTapContinue() {
      //validating the email
      String? message =
          AppValidators.validateEmail(emailController.text.trim());
      if (message != null) {
        Prompt.showSnackBar(message);
        return;
      }
      provider.checkUserExistence(emailController.text.trim());
    }

    // reusable basescreen for all auth screens
    return BaseScreen(
      title: AppStrings.hi,
      showPopIcon: false,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomTextField(
              controller: emailController,
              hintText: AppStrings.email,
              textInputType: TextInputType.emailAddress,
            ),
            15.ph, // sizebox extension widget
            PrimaryButton(
              onTap: onTapContinue,
              loader: provider.loader,
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
            15.ph, // sizebox extension widget
            SocialMediaButton(
              onTap: () {},
              text: AppStrings.contWithGoogle,
              icon: AppAssets.googleIcon,
            ),
            15.ph, // sizebox extension widget
            SocialMediaButton(
              onTap: () {},
              text: AppStrings.contWithApple,
              icon: AppAssets.appleIcon,
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
      ),
    );
  }
}
