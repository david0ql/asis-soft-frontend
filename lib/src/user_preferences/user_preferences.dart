import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  static late SharedPreferences _prefs;

  static int _idUsuario = 0;
  static String _correo = "";
  static String _nombre = "";

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static int get idUsuario {
    return _prefs.getInt("idUsuario") ?? _idUsuario;
  }

  static set idUsuario(int idUsuario) {
    _idUsuario = idUsuario;
    _prefs.setInt("idUsuario", idUsuario);
  }

  static String get nombre {
    return _prefs.getString("nombre") ?? _nombre;
  }

  static set nombre(String name) {
    _nombre = name;
    _prefs.setString("nombre", name);
  }

  static String get correo {
    return _prefs.getString("correo") ?? _correo;
  }

  static set correo(String email) {
    _correo = email;
    _prefs.setString("correo", email);
  }
}
