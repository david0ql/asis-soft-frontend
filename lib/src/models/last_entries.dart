import 'dart:convert';

class PlataformasResponse {
  PlataformasResponse({
    required this.nombre,
    required this.fecha,
  });

  String nombre;
  DateTime fecha;

  factory PlataformasResponse.fromJson(String str) =>
      PlataformasResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PlataformasResponse.fromMap(Map<String, dynamic> json) =>
      PlataformasResponse(
        nombre: json["nombre"],
        fecha: DateTime.parse(json["fecha"]),
      );

  Map<String, dynamic> toMap() => {
        "nombre": nombre,
        "fecha": fecha.toIso8601String(),
      };
}
