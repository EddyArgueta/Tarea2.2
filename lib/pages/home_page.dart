import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final String email;

  const HomePage({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Imagen de fondo
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  'https://img.freepik.com/fotos-premium/fondo-pantalla-arte-digital-abstracto-ai-generado_643360-1704.jpg', 
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Avatar 
                const CircleAvatar(
                  radius: 60,
                  backgroundImage: NetworkImage(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT6EsEaW7HNl0rfNT3Hiy7V3ZKp8U-FXFWwOQ&s', 
                  ),
                  backgroundColor: Colors.transparent,
                ),
                const SizedBox(height: 20),

                Text(
                  'Bienvenido(a), $email',
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
