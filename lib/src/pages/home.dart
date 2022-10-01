import 'dart:convert';

import 'package:asist_soft/src/pages/tab_profile.dart';
import 'package:asist_soft/src/pages/tab_scanner.dart';
import 'package:asist_soft/src/services/user_service.dart';
import 'package:asist_soft/src/theme/theme.dart';
import 'package:asist_soft/src/user_preferences/user_preferences.dart';
import 'package:asist_soft/src/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const SafeArea(
        child: TabController(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
              "#ff6666", "Cancel", false, ScanMode.QR);
          final httpRequest = await http.post(
              Uri.parse(
                  "http://byteco.tecnopymes.net/public/api_asistencia_registrar"),
              body: {
                'id_usuario': UserPreferences.idUsuario.toString(),
                'timestamp': barcodeScanRes.toString()
              });
          final response = jsonDecode(httpRequest.body);
          if (response["response"] == true) {
            showDialog(
                context: context,
                builder: (_) => const AlertDialog(
                      title: Text("Asistencia"),
                      content: Text("Asistencia exitosa"),
                    ));
          } else {
            showDialog(
                context: context,
                builder: (_) => const AlertDialog(
                      title: Text("Asistencia"),
                      content: Text("Parece que no estas en la sede"),
                    ));
          }
        },
        elevation: 4,
        backgroundColor: UserTheme.primaryColor,
        child: const Icon(Icons.camera_alt_sharp),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: const CustomNavigationBar(),
    );
  }
}

class TabController extends StatelessWidget {
  const TabController({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userService = Provider.of<UserService>(context);
    switch (userService.selectedIndex) {
      case 0:
        return const TabScanner();
      case 1:
        return const TabProfile();
      default:
        return const TabScanner();
    }
  }
}
