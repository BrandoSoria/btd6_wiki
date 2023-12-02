import 'package:configuracion_loggin/screens/odyssey_information_screen.dart';
import 'package:flutter/material.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('BTD6 Odyssey Info'),
        ),
        body: OdysseyDetails(odyssey: getSampleOdyssey()), // Pasa la odisea como argumento
      ),
    );
  }
}
