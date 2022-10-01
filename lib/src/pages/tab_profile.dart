import 'package:asist_soft/src/user_preferences/user_preferences.dart';
import 'package:flutter/material.dart';

class TabProfile extends StatelessWidget {
  const TabProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          UserPreferences.correo = "";
          UserPreferences.idUsuario = 0;
          Navigator.pushReplacementNamed(context, 'login');
        },
        child: const Text("Cerrar sesion"),
      ),
    );
  }
}
