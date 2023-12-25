import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hey_flutter_task/presentation/pages/welcome_screen.dart';

import 'core/routes/app_router.dart';
import 'presentation/widgets/unfocus_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 812),
      minTextAdapt: true,
      builder: (_, ctx) {
        return MaterialApp(
          title: 'Authentication',
          builder: (context, child) => UnFocusWidget(child: child!),
          home: const WelcomeScreen(),
          navigatorKey: AppRouter.navKey,
        );
      },
    );
  }
}
