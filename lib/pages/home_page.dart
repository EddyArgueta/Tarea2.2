import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final String email;

  const HomePage({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: Text('Bienvenido(a), $email'),
      ),
    );
  }
}