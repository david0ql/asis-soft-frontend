import 'package:asist_soft/src/user_preferences/user_preferences.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 4500), () {
      (UserPreferences.idUsuario != 0)
          ? Navigator.pushReplacementNamed(context, 'home')
          : Navigator.pushReplacementNamed(context, 'login');
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Lottie.asset("assets/qr_code.json"),
      ),
    );
  }
}
