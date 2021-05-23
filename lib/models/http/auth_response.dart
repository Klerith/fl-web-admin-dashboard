// To parse this JSON data, do
//
//     final authResponse = authResponseFromMap(jsonString);
import 'dart:convert';

import '../usuario.dart';

class AuthResponse {
    AuthResponse({
        required this.usuario,
        required this.token,
    });

    Usuario usuario;
    String token;

    factory AuthResponse.fromJson(String str) => AuthResponse.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory AuthResponse.fromMap(Map<String, dynamic> json) => AuthResponse(
        usuario: Usuario.fromMap(json["usuario"]),
        token: json["token"],
    );

    Map<String, dynamic> toMap() => {
        "usuario": usuario.toMap(),
        "token": token,
    };
}

