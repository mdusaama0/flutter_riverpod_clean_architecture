import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';
import '../../core/theme/text_styles.dart';

class PrivacyPolicyWidget extends StatelessWidget {
  const PrivacyPolicyWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'By selecting Agree and continue below,',
          style: TextStyles.subTitleStyle,
        ),
        Row(
          children: [
            Text(
              'I agree to ',
              style: TextStyles.subTitleStyle,
            ),
            TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                  minimumSize: const Size(50, 30),
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  alignment: Alignment.centerLeft),
              child: Text(
                'Terms of Service',
                style: TextStyles.btnTextStyle.copyWith(
                  color: AppColors.primaryColor,
                  fontSize: 14,
                ),
              ),
            ),
            Text(
              ' and ',
              style: TextStyles.subTitleStyle
                  .copyWith(color: AppColors.primaryColor),
            ),
            TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                  minimumSize: const Size(50, 30),
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  alignment: Alignment.centerLeft),
              child: Text(
                'Privacy Policy',
                style: TextStyles.btnTextStyle.copyWith(
                  color: AppColors.primaryColor,
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
