import 'package:asist_soft/src/pages/pages.dart';
import 'package:flutter/material.dart';

class MyRoutes {
  static Map<String, Widget Function(BuildContext context)> routes = {
    'home': (context) => const HomePage(),
    'login': (context) => const LoginPage(),
    'splash': (context) => const SplashPage()
  };
}
