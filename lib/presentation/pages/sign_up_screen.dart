import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hey_flutter_task/core/utils/app_extensions.dart';
import 'package:hey_flutter_task/core/theme/text_styles.dart';
import 'package:hey_flutter_task/core/utils/app_strings.dart';
import 'package:hey_flutter_task/domain/entities/sign_up_entity.dart';
import 'package:hey_flutter_task/presentation/pages/base_screen.dart';
import 'package:hey_flutter_task/presentation/widgets/custom_text_field.dart';
import 'package:hey_flutter_task/presentation/widgets/primary_button.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../core/utils/app_prompts.dart';
import '../../core/utils/app_validators.dart';
import '../providers/auth_provider.dart';
import '../widgets/privacy_policy_widget.dart';

class SignuUpScreen extends HookConsumerWidget {
  final String? email;
  const SignuUpScreen({super.key, this.email});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var provider = ref.watch(authProvider); //auth provider class instance
    final isObsecure = useState(true); //state variable for show hide password
    //text editing controllers hook to dispose it automatically
    final nameController = useTextEditingController();
    final passwordController = useTextEditingController();

    //onTap Agree and Continue handler
    onTapAgreeCont() {
      //validating name
      String? message = AppValidators.validateName(nameController.text.trim());
      if (message != null) {
        Prompt.showSnackBar(message);
        return;
      }
      //validating password
      message = AppValidators.validatePassword(passwordController.text.trim());
      if (message != null) {
        Prompt.showSnackBar(message);
        return;
      }

      //signup entity for user details
      SignUpEntity signUpEntity = SignUpEntity(
        email: email!,
        password: passwordController.text.trim(),
        name: nameController.text.trim(),
        //passing static url for profile pic
        profilePic:
            'https://media.istockphoto.com/id/656673020/photo/handsome-in-spectacles.jpg?s=2048x2048&w=is&k=20&c=sFtyaj9yhA-0XQPVDX8lSyKvevIXl0K8L-QHtO2rERo=',
      );
      provider.signUp(signUpEntity);
    }

    return BaseScreen(
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
                  style: TextStyles.subTitleStyle,
                ),
                Text(
                  email!,
                  style: TextStyles.subTitleStyle
                      .copyWith(fontSize: 14.sp, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          25.ph, // sizebox extension widget
          CustomTextField(
            controller: nameController,
            hintText: AppStrings.name,
          ),
          15.ph, // sizebox extension widget
          CustomTextField(
            controller: passwordController,
            hintText: AppStrings.password,
            isObscure: isObsecure.value,
            isSuffix: true,
            onTapSuffix: () => isObsecure.value = !isObsecure.value,
          ),
          25.ph, // sizebox extension widget
          const PrivacyPolicyWidget(),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 15.h),
            child: PrimaryButton(
              onTap: onTapAgreeCont,
              loader: provider.loader,
              text: AppStrings.agreeCont,
            ),
          ),
        ],
      ),
    );
  }
}
