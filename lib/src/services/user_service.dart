import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/last_entries.dart';

class UserService with ChangeNotifier {
  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  set selectedIndex(int value) {
    _selectedIndex = value;
    notifyListeners();
  }

  Future<List<PlataformasResponse>> lastEntries(String idUsuario) async {
    final httpRequest = await http.post(
        Uri.parse("http://byteco.tecnopymes.net/public/api_last_entries"),
        body: {'id_usuario': idUsuario});
    final List dataRaw = jsonDecode(httpRequest.body);
    final List<PlataformasResponse> lastEntries = [];
    for (var element in dataRaw) {
      lastEntries.add(PlataformasResponse.fromMap(element));
    }
    return lastEntries;
  }
}
