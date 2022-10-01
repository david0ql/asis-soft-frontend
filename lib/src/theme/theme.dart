import 'package:flutter/material.dart';

class UserTheme {
  static const Color primaryColor = Color(0XFF303f9f);

  static final theme = ThemeData.light().copyWith(
      appBarTheme: const AppBarTheme(
        backgroundColor: primaryColor,
        shadowColor: primaryColor,
        elevation: 0,
      ),
      colorScheme: ThemeData().colorScheme.copyWith(primary: primaryColor));
}
