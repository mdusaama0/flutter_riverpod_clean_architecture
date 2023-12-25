import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hey_flutter_task/core/theme/app_colors.dart';
import 'package:hey_flutter_task/core/utils/app_extensions.dart';
import 'package:hey_flutter_task/core/theme/text_styles.dart';
import 'package:hey_flutter_task/core/utils/app_strings.dart';
import 'package:hey_flutter_task/presentation/pages/base_screen.dart';
import 'package:hey_flutter_task/presentation/widgets/custom_text_field.dart';
import 'package:hey_flutter_task/presentation/widgets/primary_button.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LoginScreen extends HookConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isObsecure = useState(true);
    final passwordController = useTextEditingController();
    return BaseScren(
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
                  'https://media.istockphoto.com/id/656673020/photo/handsome-in-spectacles.jpg?s=2048x2048&w=is&k=20&c=sFtyaj9yhA-0XQPVDX8lSyKvevIXl0K8L-QHtO2rERo=',
                  height: 60.h,
                  width: 60.h,
                  fit: BoxFit.cover,
                ),
              ),
              15.pw,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Jane Dow',
                    style: TextStyles.titleStyle.copyWith(fontSize: 16),
                  ),
                  Text('jane.doe@gmail.com', style: TextStyles.subTitleStyle),
                ],
              ),
            ],
          ),
          25.ph,
          CustomTextField(
            controller: passwordController,
            hintText: AppStrings.password,
            isObscure: isObsecure.value,
            isSuffix: true,
            onTap: () => isObsecure.value = !isObsecure.value,
          ),
          15.ph,
          PrimaryButton(
            onTap: () {},
            text: AppStrings.continueText,
          ),
          15.ph,
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
