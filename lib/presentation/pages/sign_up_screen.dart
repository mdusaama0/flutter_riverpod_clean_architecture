import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hey_flutter_task/core/utils/app_extensions.dart';
import 'package:hey_flutter_task/core/theme/text_styles.dart';
import 'package:hey_flutter_task/core/utils/app_strings.dart';
import 'package:hey_flutter_task/presentation/pages/base_screen.dart';
import 'package:hey_flutter_task/presentation/widgets/custom_text_field.dart';
import 'package:hey_flutter_task/presentation/widgets/primary_button.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../widgets/privacy_policy_widget.dart';

class SignuUpScreen extends HookConsumerWidget {
  const SignuUpScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isObsecure = useState(true);
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    return BaseScren(
      title: AppStrings.signup,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppStrings.signupDesc,
                  style: TextStyles.subTitleStyle.copyWith(fontSize: 16.sp),
                ),
                Text(
                  'jane.doe@gmail.com',
                  style: TextStyles.subTitleStyle
                      .copyWith(fontSize: 16.sp, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          25.ph,
          CustomTextField(
            controller: emailController,
            hintText: AppStrings.email,
          ),
          15.ph,
          CustomTextField(
            controller: passwordController,
            hintText: AppStrings.password,
            isObscure: isObsecure.value,
            isSuffix: true,
            onTapSuffix: () => isObsecure.value = !isObsecure.value,
          ),
          25.ph,
          const PrivacyPolicyWidget(),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 15.h),
            child: PrimaryButton(
              onTap: () {},
              text: AppStrings.agreeCont,
            ),
          ),
        ],
      ),
    );
  }
}
