import 'package:flutter/material.dart';

class PageNotFound extends StatelessWidget {
  const PageNotFound({super.key});

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

          const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                  Icons.not_interested,
                  size: 120,
                  color: Colors.white,
                ),
                Text('Ruta no encontrada (≧ n ≦)',  
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
                ),
            ],
          ),
        ],
      ),
    );
  }
}