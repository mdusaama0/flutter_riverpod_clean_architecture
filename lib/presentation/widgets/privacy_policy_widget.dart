import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';
import '../../core/theme/text_styles.dart';

class PrivacyPolicyWidget extends StatelessWidget {
  const PrivacyPolicyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: TextStyles.subTitleStyle,
        children: <TextSpan>[
          const TextSpan(
            text: 'By selecting Agree and continue below,\nI agree to ',
          ),
          _buildTappableTextSpan(
            text: 'Terms of Service',
            onTap: () {},
          ),
          const TextSpan(
            text: ' and ',
          ),
          _buildTappableTextSpan(
            text: 'Privacy Policy',
            onTap: () {},
          ),
        ],
      ),
    );
  }

  TextSpan _buildTappableTextSpan({
    required String text,
    void Function()? onTap,
  }) {
    return TextSpan(
      text: text,
      style: TextStyles.subTitleStyle.copyWith(
        color: AppColors.primaryColor,
      ),
      recognizer: TapGestureRecognizer()..onTap = onTap,
    );
  }
}
