import 'package:flutter/material.dart';
import 'package:login_app/pages/home_page.dart';
import 'package:login_app/pages/login_page.dart';
import 'package:login_app/pages/registro_page.dart';
import 'package:login_app/shared/page_not_found.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Material App',
      debugShowCheckedModeBanner: false,
      //home: const HomePage(email: 'carguetar@unah.hn'),
      //home: LoginPage(),
      //home: const PageNotFound(),
      home: RegistroPage(),

      onGenerateRoute: (settings) => MaterialPageRoute(
      builder: (context) {
      if (settings.name == '/') return const HomePage(email: 'carguetar@unah.hn');

      return const PageNotFound();
      },
      ),
      ); 
  }
}
