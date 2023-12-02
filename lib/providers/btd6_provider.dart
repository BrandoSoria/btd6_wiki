import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:configuracion_loggin/models/models.dart';

class Btd6Provider extends ChangeNotifier {
  final String _baseUrl = 'data.ninjakiwi.com';
  //la api no exige apikey
  // final String _accessKey = '1969851b2f4120200babf94ee04c1054';
 //poderes disponibles
  List<AvailablePower> newsList = [];
  //List<News> popularNews = [];

  Btd6Provider() {
    getPowers();
  }


  getPowers() async {
    //endpoint
    var url = Uri.http(_baseUrl, '/btd6/odyssey/lpko5tzn/easy', {
      // 'access_key': _accessKey,

    
    });

    final response = await http.get(url);
    final Map<String, dynamic> decodeData = json.decode(response.body);
    //print(decodeData);
    //print(response.body);
    final techResponse = Odysseybt6Response.fromRawJson(response.body);
    //aquiqeude
    newsList = techResponse.;
    //Le comunicamos a todos los widgets que estan escuchando que se cambio la data por lo tanto se tienen que redibujar
    notifyListeners();
    //print(techResponse.results[0].title);
  }

  /*getPopularNews() async {
    var url = Uri.https(_baseUrl, '3/movie/popular',
        {'api_key': _accessKey, 'language': _language, 'page': '1'});

    final response = await http.get(url);

    final popularResponse = PopularResponse.fromRawJson(response.body);

    //Destructurar resultado para cambiar pagina y mantener los actuales
    popularNews = [...popularNews, ...popularResponse.results];
    notifyListeners();
  }*/
}
