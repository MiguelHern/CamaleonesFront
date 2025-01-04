import 'package:flutter/material.dart';
import 'screens/home_page.dart';
import 'screens/login_page.dart';
import 'screens/signing_page.dart';
import 'screens/admin/settings_page.dart';  // Importa la página de ajustes
import 'theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: appTheme,
      initialRoute: '/settings', // Cambia la ruta inicial a la página de ajustes
      routes: {
        '/': (context) => const LoginPage(),
        '/home': (context) => const HomePage(),
        '/register': (context) => const SignIn(),
        '/settings': (context) => const SettingsPage(),  // Ruta de la página de ajustes
      },
    );
  }
}
