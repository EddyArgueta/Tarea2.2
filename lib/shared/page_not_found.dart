import 'package:flutter/material.dart';

class PageNotFound extends StatelessWidget {
  const PageNotFound({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.not_interested,
              size: 120,
              color: Colors.lightBlue,
            ),
            Text('Ruta no encontrada (≧ ﹏ ≦)',  
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),),
          ],
        ),
      ),
    );
  }
}