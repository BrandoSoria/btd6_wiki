import 'package:configuracion_loggin/Pages/pages.dart';
import 'package:configuracion_loggin/providers/login_form_provider.dart';
import 'package:configuracion_loggin/screens/favorite_bosses_screen.dart';
import 'package:configuracion_loggin/services/auth_services.dart';
import 'package:configuracion_loggin/services/notifications_services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:configuracion_loggin/providers/btd6_provider.dart';
import 'package:configuracion_loggin/screens/odyssey_information_screen.dart';
import 'package:configuracion_loggin/screens/bosses_information.dart';

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
        ChangeNotifierProvider(
          create: (_) => LoginFormProvider(),
          lazy: false,
        ),
        ChangeNotifierProvider(
          create: (_) => AuthService(),
          lazy: false,
        )
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
      title: 'BTD6 WIKI',
      initialRoute: 'login', // Puedes establecer la ruta inicial si lo deseas
      routes: {
        'login': (context) => LoginScreen(),
        'register': (context) => SignUpScreen(),
        'home': (context) => const OdysseyInformationScreen(),
        'bosses': (context) => const BossesInformationScreen(),
        'favoritebosses': (context) => const FavoriteBossesScreen(),
      },
      scaffoldMessengerKey: NotificationsService.messengerKey,
      /*theme: ThemeData.dark().copyWith(
            scaffoldBackgroundColor: Colors.grey[800],
            appBarTheme:
                const AppBarTheme(elevation: 0, color: Colors.redAccent),
            floatingActionButtonTheme: const FloatingActionButtonThemeData(
                backgroundColor: Colors.redAccent, elevation: 0))*/
      theme: ThemeData.light().copyWith(
          scaffoldBackgroundColor: Color.fromARGB(239, 213, 13, 13),
          appBarTheme: const AppBarTheme(elevation: 0, color: Colors.redAccent),
          floatingActionButtonTheme: const FloatingActionButtonThemeData(
              backgroundColor: Colors.redAccent, elevation: 0)),
    );
  }
}
