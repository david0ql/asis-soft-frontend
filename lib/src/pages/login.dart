// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:asist_soft/src/user_preferences/user_preferences.dart';
import 'package:asist_soft/src/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(children: const [
              _HeaderBackground(),
              _IconPosition(),
            ]),
            Container(
              margin: const EdgeInsets.all(10),
              child: const FittedBox(
                child: Text(
                  "Byteco",
                  style: TextStyle(fontWeight: FontWeight.w200, fontSize: 50),
                ),
              ),
            ),
            const _LoginContainer()
          ],
        ),
      ),
    );
  }
}

class _HeaderBackground extends StatelessWidget {
  const _HeaderBackground({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height * 0.35,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(25), bottomRight: Radius.circular(25)),
        color: Color(0XFF303f9f),
      ),
    );
  }
}

class _IconPosition extends StatelessWidget {
  const _IconPosition({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(top: size.height * 0.22),
      width: double.infinity,
      height: size.height * 0.25,
      child: const Image(image: AssetImage("assets/icon.png")),
    );
  }
}

class _LoginContainer extends StatefulWidget {
  const _LoginContainer({Key? key}) : super(key: key);

  @override
  State<_LoginContainer> createState() => _LoginContainerState();
}

class _LoginContainerState extends State<_LoginContainer> {
  final emailCtrl = TextEditingController();
  final pwdCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      width: double.infinity,
      decoration: BoxDecoration(
          color: const Color(0xFFF2F2F2),
          borderRadius: BorderRadius.circular(25)),
      child: Container(
        margin: const EdgeInsets.all(15),
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          CustomInputField(
              icon: const Icon(Icons.email),
              label: 'Correo',
              textEditingController: emailCtrl),
          const SizedBox(
            height: 10,
          ),
          CustomInputField(
              icon: const Icon(Icons.password),
              label: 'Clave',
              obscure: true,
              textEditingController: pwdCtrl),
          const SizedBox(
            height: 10,
          ),
          CustomButton(
              onPressed: () async {
                final responseFuture = await loginAction(emailCtrl, pwdCtrl);
                final responseCode = responseFuture['response'];
                final idUsuario = responseFuture['id_usuario'];
                if (responseCode == true) {
                  UserPreferences.correo = emailCtrl.text;
                  UserPreferences.idUsuario = idUsuario;
                  Navigator.pushReplacementNamed(context, 'home');
                } else {
                  showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                            title: const Text("Inicio de sesion"),
                            content: const Text(
                                "No te encontramos en nuestra base de datos"),
                            actions: [
                              SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text("Cerrar")),
                              )
                            ],
                          ));
                  FocusScope.of(context).unfocus();
                }
              },
              button: 'Iniciar sesion')
        ]),
      ),
    );
  }

  Future loginAction(
      TextEditingController user, TextEditingController pwd) async {
    final httpRequest = await http.post(
        Uri.parse("https://byteco.tecnopymes.net/public/api_login"),
        body: {'email': user.text, 'password': pwd.text});
    return jsonDecode(httpRequest.body);
  }
}
