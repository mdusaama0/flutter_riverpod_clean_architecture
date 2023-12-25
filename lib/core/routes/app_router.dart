import 'package:flutter/material.dart';

class AppRouter {
  static GlobalKey<NavigatorState> navKey = GlobalKey<NavigatorState>();

  static void back() {
    Navigator.pop(navKey.currentContext!);
  }

  static push(page) async {
    await Navigator.push(
      navKey.currentContext!,
      MaterialPageRoute(builder: (context) => page),
    );
  }

  static pushReplacement(page) async {
    await Navigator.pushReplacement(
      navKey.currentContext!,
      MaterialPageRoute(builder: (context) => page),
    );
  }

  static pushAndRemoveUntil(page) async {
    await Navigator.pushAndRemoveUntil(
      navKey.currentContext!,
      MaterialPageRoute(builder: (context) => page),
      (Route<dynamic> route) => false,
    );
  }

  static pushAndRemoveUntilWithAnimation(page) async {
    await Navigator.pushAndRemoveUntil(
      navKey.currentContext!,
      PageRouteBuilder(
          transitionDuration: const Duration(seconds: 2),
          pageBuilder: (_, __, ___) => page),
      (Route<dynamic> route) => false,
    );
  }
}
