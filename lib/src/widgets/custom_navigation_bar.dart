import 'package:asist_soft/src/services/user_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userService = Provider.of<UserService>(context);
    return BottomNavigationBar(
      elevation: 4,
      items: const [
        BottomNavigationBarItem(
            icon: Icon(Icons.qr_code_scanner), label: 'Asistencia'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Perfil')
      ],
      currentIndex: userService.selectedIndex,
      onTap: (int value) {
        userService.selectedIndex = value;
      },
    );
  }
}
