import 'package:flutter/material.dart';
import 'package:login_app/pages/home_page.dart';
import 'package:login_app/pages/registro_page.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Inicio de Sesión',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30.0,
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 20.0),
                  Form(
                key: formKey,
                
                //Con esta opcion, cuando vuelva a la Pantalla de Login despues de ir a la de Registro
                //No me saldran en rojo los campos de correo y password
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  children: [
                    TextFormField(
                      controller: emailController,
                      maxLength: 30,
                  ),
                    TextFormField(
                      controller: passwordController,
                      obscureText: true,
                      maxLength: 30,
                    ),
                  ],
                ),
                  ),
                  const SizedBox(height: 20.0),
                  ElevatedButton(
                    onPressed: () {
                      // Validacion de las credenciales
                      if (emailController.text == 'carguetar@unah.hn' &&
                          passwordController.text == '20172001120') {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => HomePage(email: emailController.text)),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text('Credenciales incorrectas'),
                        ));
                      }
                    },
                    child: const Text('Iniciar Sesión',
                    style: TextStyle(color: Colors.black), 
                    textAlign: TextAlign.center),
                  ),
                  const SizedBox(height: 10.0),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const RegistroPage()),
                      );
                    },
                    child: const Text('Registrarse', 
                    style: TextStyle(color: Colors.black), 
                    textAlign: TextAlign.center),
                  ),
                  const SizedBox(height: 160.0),
                ],
              ),
            ),
          ),
          
          Positioned(
            bottom: 10.0,
            left: 0,
            right: 0,
            child: Center(
              child: Text(
                'Hecho por Carlos Argueta',
                style: TextStyle(
                  color: Colors.grey[500],
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}