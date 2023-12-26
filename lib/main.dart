import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hey_flutter_task/presentation/pages/welcome_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

import 'core/routes/app_router.dart';
import 'presentation/widgets/unfocus_widget.dart';

void main() async {
  //initial bindings
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  //setting the app for potrait mode only
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
          //if keyboard is open this widget will dismiss it on tap anywhere on screen
          builder: (context, child) => UnFocusWidget(child: child!),
          home: const WelcomeScreen(),
          navigatorKey: AppRouter.navKey,
        );
      },
    );
  }
}
