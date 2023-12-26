import 'package:flutter/material.dart';
import 'package:hey_flutter_task/core/theme/text_styles.dart';

import '../routes/app_router.dart';

class Prompt {
  static void showSnackBar(String message, {Duration? duration}) {
    ScaffoldMessenger.of(AppRouter.navKey.currentContext!).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        content: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Text(
            message.contains('Exception:')
                ? message.replaceAll('Exception: ', '')
                : message,
            style: TextStyles.subTitleStyle,
          ),
        ),
        action: SnackBarAction(
          label: 'Close',
          textColor: Colors.white,
          onPressed: () {
            ScaffoldMessenger.of(AppRouter.navKey.currentContext!)
                .hideCurrentSnackBar();
          },
        ),
        duration: duration ?? const Duration(seconds: 2),
      ),
    );
  }
}
