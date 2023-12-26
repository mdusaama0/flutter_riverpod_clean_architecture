import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hey_flutter_task/core/theme/app_colors.dart';
import 'package:hey_flutter_task/core/utils/app_extensions.dart';
import 'package:hey_flutter_task/core/theme/text_styles.dart';
import 'package:hey_flutter_task/core/utils/app_strings.dart';
import 'package:hey_flutter_task/core/utils/app_validators.dart';
import 'package:hey_flutter_task/data/models/user_model.dart';
import 'package:hey_flutter_task/domain/entities/sign_in_entity.dart';
import 'package:hey_flutter_task/presentation/pages/base_screen.dart';
import 'package:hey_flutter_task/presentation/widgets/custom_text_field.dart';
import 'package:hey_flutter_task/presentation/widgets/primary_button.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../core/utils/app_prompts.dart';
import '../providers/auth_provider.dart';

class LoginScreen extends HookConsumerWidget {
  final UserModel? user;
  const LoginScreen({super.key, this.user});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var provider = ref.watch(authProvider); //auth provider class instance
    final isObsecure = useState(true); //state variable for show hide password
    //text editing controller hook to dispose it automatically
    final passwordController = useTextEditingController();

    //onTap continue handler
    onTapContiue() {
      //validating password
      String? message =
          AppValidators.validatePassword(passwordController.text.trim());
      if (message != null) {
        Prompt.showSnackBar(message);
        return;
      }

      //sign in entity of user login detail
      SignInEntity signInEntity = SignInEntity(
        email: user!.email,
        password: passwordController.text.trim(),
      );
      provider.signIn(signInEntity);
    }

    return BaseScreen(
      title: AppStrings.login,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipOval(
                child: Image.network(
                  user!.profile,
                  height: 60.h,
                  width: 60.h,
                  fit: BoxFit.cover,
                ),
              ),
              15.pw, // sizebox extension widget for width
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    user!.name,
                    style: TextStyles.titleStyle.copyWith(fontSize: 16),
                  ),
                  Text(user!.email, style: TextStyles.subTitleStyle),
                ],
              ),
            ],
          ),
          25.ph, // sizebox extension widget
          CustomTextField(
            controller: passwordController,
            hintText: AppStrings.password,
            isObscure: isObsecure.value,
            isSuffix: true,
            onTapSuffix: () => isObsecure.value = !isObsecure.value,
          ),
          15.ph, // sizebox extension widget
          PrimaryButton(
            onTap: onTapContiue,
            loader: provider.loader,
            text: AppStrings.continueText,
          ),
          15.ph, // sizebox extension widget
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
          ),
        ],
      ),
    );
  }
}
