import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hey_flutter_task/core/routes/app_router.dart';
import 'package:hey_flutter_task/core/utils/app_extensions.dart';
import 'package:hey_flutter_task/core/utils/app_strings.dart';
import 'package:hey_flutter_task/data/models/user_model.dart';
import 'package:hey_flutter_task/presentation/pages/base_screen.dart';
import 'package:hey_flutter_task/presentation/pages/welcome_screen.dart';
import 'package:hey_flutter_task/presentation/widgets/primary_button.dart';

import '../../core/theme/text_styles.dart';

class ProfileScreen extends StatelessWidget {
  final UserModel? user;
  const ProfileScreen({super.key, this.user});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      title: AppStrings.hello,
      showPopIcon: false,
      child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipOval(
                child: Image.network(
                  user!.profile,
                  height: 100.h,
                  width: 100.h,
                  fit: BoxFit.cover,
                ),
              ),
              15.ph,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${AppStrings.email}:',
                    style: TextStyles.titleStyle.copyWith(fontSize: 16),
                  ),
                  Text(user!.email, style: TextStyles.subTitleStyle),
                ],
              ),
              Divider(
                color: Colors.white.withOpacity(0.4),
              ),
              5.ph,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${AppStrings.name}:',
                    style: TextStyles.titleStyle.copyWith(fontSize: 16),
                  ),
                  Text(
                    user!.name,
                    style: TextStyles.subTitleStyle,
                  ),
                ],
              ),
            ],
          ),
          15.ph,
          PrimaryButton(
            onTap: () => AppRouter.pushAndRemoveUntil(const WelcomeScreen()),
            text: AppStrings.logout,
          ),
          15.ph,
          PrimaryButton(
            onTap: () {},
            text: AppStrings.deleteAccount,
            backgroundColor: Colors.redAccent,
          ),
        ],
      ),
    );
  }
}
