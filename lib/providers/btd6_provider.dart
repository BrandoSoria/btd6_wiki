import 'dart:convert';
import 'package:configuracion_loggin/models/body_boss.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:configuracion_loggin/models/body.dart';

class Btd6Provider extends ChangeNotifier {
  final String _baseUrl = 'data.ninjakiwi.com';

  Body? odyssey; // Almacena la odisea obtenida
  BodyBoss? boss;

  Btd6Provider();

  Future<void> getPowers() async {
    try {
      var url = Uri.http(_baseUrl, '/btd6/odyssey/lpko5tzn/easy', {});

      final response = await http.get(url);

      final Map<String, dynamic> decodeData = json.decode(response.body);

      odyssey =
          Body.fromJson(decodeData); // Convierte la respuesta a un objeto Body

      notifyListeners();
    } catch (error) {
      // Maneja el error según tus necesidades
      print('Error: $error');
    }
  }


  Future<void> getBosses() async {
    try {
      var url = Uri.http(_baseUrl, '/btd6/bosses', {});

      final response = await http.get(url);

      final Map<String, dynamic> decodeData = json.decode(response.body);

      boss =
          BodyBoss.fromJson(decodeData); // Convierte la respuesta a un objeto Body

      notifyListeners();
    } catch (error) {
      // Maneja el error según tus necesidades
      print('Error: $error');
    }
  }
}
