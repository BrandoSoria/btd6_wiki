
import 'package:configuracion_loggin/providers/btd6_provider.dart';
import 'package:configuracion_loggin/screens/odyssey_information_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


void main() => runApp(const AppState());

class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => Btd6Provider(),
          lazy: false,
        ),
        // ChangeNotifierProvider(
        //   create: (_) => LoginFormProvider(),
        //   lazy: false,
        // ),
        // ChangeNotifierProvider(
        //   create: (_) => AuthService(),
        //   lazy: false,
        // )
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BTD6 Information Odyssey Atributes',
      // initialRoute: 'login',
      routes: {
        // 'login': (_) => LoginScreen(),
        // 'register': (_) => RegisterScreen(),
        'home': (_) => OdysseyDetails(),
        
        // 'checking': (_) => CheckAuthScreen()
      },
    );
  }
}
