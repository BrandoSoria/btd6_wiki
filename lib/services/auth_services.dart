import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class AuthService extends ChangeNotifier {
  final String _baseUrl = 'http://www.jwtingesoria.somee.com';
  final String _apiBaseUrl = 'https://mis-jefes-btd6.onrender.com/api';
  final storage = FlutterSecureStorage();

  Future<String?> createUser(String email, String password) async {
    final authData = {'email': email, 'password': password};
    final url = Uri.parse('$_baseUrl/api/Cuentas/registrar');

    try {
      final resp = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: json.encode(authData),
      );

      if (resp.statusCode == 200) {
        final Map<String, dynamic> decodedResp = json.decode(resp.body);

        if (decodedResp.containsKey('token')) {
          await storage.write(key: 'token', value: decodedResp['token']);
          return null;
        } else {
          return 'La respuesta del servidor no contiene un token';
        }
      } else {
        return 'Error en la solicitud: ${resp.reasonPhrase}';
      }
    } catch (e) {
      print('Error en la solicitud: $e');
      return 'Error en la solicitud';
    }
  }

  Future<String?> login(String email, String password) async {
    final authData = {'email': email, 'password': password};
    final url = Uri.parse('$_baseUrl/api/Cuentas/Login');

    try {
      final resp = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: json.encode(authData),
      );

      if (resp.statusCode == 200) {
        final Map<String, dynamic> decodedResp = json.decode(resp.body);

        if (decodedResp.containsKey('token')) {
          await storage.write(key: 'token', value: decodedResp['token']);
          return null;
        } else {
          return 'La respuesta del servidor no contiene un token';
        }
      } else {
        return 'Error en la solicitud: ${resp.reasonPhrase}';
      }
    } catch (e) {
      print('Error en la solicitud: $e');
      return 'Error en la solicitud';
    }
  }

  Future<List<Map<String, dynamic>>> getFavoriteBosses() async {
    final token = await readToken();
    final response = await http.get(
      Uri.parse('$_apiBaseUrl/favoritos'),
      headers: {'Authorization': 'Bearer $token'},
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.cast<Map<String, dynamic>>();
    } else {
      throw Exception(
          'Error al obtener jefes favoritos: ${response.reasonPhrase}');
    }
  }

  Future<void> addFavoriteBoss(String nombreJefe, String imagen) async {
    final token = await readToken();
    final headers = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
    };

    final body = json.encode({
      'nombreJefe': nombreJefe,
      'imagen': imagen,
    });

    try {
      final response = await http.post(
        Uri.parse('$_apiBaseUrl/favoritos/agregar'),
        headers: headers,
        body: body,
      );

      if (response.statusCode == 201) {
        print('Jefe favorito agregado correctamente');
      } else {
        throw Exception(
            'Error al agregar jefe favorito: ${response.reasonPhrase}');
      }
    } catch (error) {
      throw Exception('Error al agregar jefe favorito: $error');
    }
  }

  Future<void> removeFavoriteBoss(String idJefe) async {
    final token = await readToken();
    final headers = {'Authorization': 'Bearer $token'};

    try {
      final response = await http.delete(
        Uri.parse('$_apiBaseUrl/favoritos/quitar/$idJefe'),
        headers: headers,
      );

      if (response.statusCode == 200) {
        print('Jefe favorito eliminado correctamente');
      } else {
        throw Exception(
            'Error al quitar jefe favorito: ${response.reasonPhrase}');
      }
    } catch (error) {
      throw Exception('Error al quitar jefe favorito: $error');
    }
  }

  Future logout() async {
    await storage.delete(key: 'token');
  }

  Future<String> readToken() async {
    return await storage.read(key: 'token') ?? '';
  }
}
