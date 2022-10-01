import 'package:asist_soft/src/models/last_entries.dart';
import 'package:asist_soft/src/services/user_service.dart';
import 'package:asist_soft/src/user_preferences/user_preferences.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TabScanner extends StatefulWidget {
  const TabScanner({Key? key}) : super(key: key);

  @override
  State<TabScanner> createState() => _TabScannerState();
}

class _TabScannerState extends State<TabScanner> {
  @override
  Widget build(BuildContext context) {
    final userService = Provider.of<UserService>(context);
    return Scaffold(
      appBar: AppBar(
          title: const Center(
        child: Text("MIS ASISTENCIAS"),
      )),
      body: SafeArea(
        child: FutureBuilder(
          future: userService.lastEntries(UserPreferences.idUsuario.toString()),
          builder: (context, snapshot) {
            if (snapshot.hasData &&
                snapshot.connectionState == ConnectionState.done) {
              return RefreshIndicator(
                onRefresh: () {
                  return Future(() {
                    setState(() {});
                  });
                },
                child: ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return customCard(snapshot.data![index]);
                  },
                ),
              );
            } else {
              return const Center(child: CupertinoActivityIndicator());
            }
          },
        ),
      ),
    );
  }

  Widget customCard(PlataformasResponse plataforma) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: Card(
        elevation: 8,
        child: Container(
          margin: const EdgeInsets.all(10),
          child: Column(children: [
            Text(
              "Nombre: ${plataforma.nombre}",
              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
            ),
            Text("Hora de llegada: ${plataforma.fecha}",
                style:
                    const TextStyle(fontSize: 25, fontWeight: FontWeight.w300))
          ]),
        ),
      ),
    );
  }
}
