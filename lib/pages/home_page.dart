import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final String email;

  const HomePage({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        backgroundColor:const Color.fromARGB(255, 252, 250, 166),
      ),
      body: Center(
        child: Text('Bienvenido(a), $email'),
      ),
    );
  }
}