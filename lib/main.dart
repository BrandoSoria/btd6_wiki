// main.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:configuracion_loggin/providers/btd6_provider.dart';
import 'package:configuracion_loggin/screens/odyssey_information_screen.dart';
import 'package:configuracion_loggin/screens/bosses_information.dart'; // Importa la nueva pantalla

void main() => runApp(const AppState());

class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => Btd6Provider(),
          lazy: false,
        ),
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BTD6 Information Odyssey Attributes',
      initialRoute: '/home', // Puedes establecer la ruta inicial si lo deseas
      routes: {
        '/home': (context) => const OdysseyInformationScreen(),
        '/bosses': (context) =>
            const BossesInformationScreen(), // Agrega la ruta para la pantalla de bosses
      },
    );
  }
}
