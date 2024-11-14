import 'package:flutter/material.dart';
import 'package:login_app/pages/home_page.dart';
import 'package:login_app/pages/registro_page.dart';
import 'package:login_app/widgets/inputs.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController correoController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  final FocusNode correoFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Stack Class
      //A widget that positions its children relative to the edges of its box.
      //This class is useful if you want to overlap several children in a simple way, 
      //for example having some text and an image, overlaid with a gradient and a button attached to the bottom.
      body: Stack(
        children: [
          // Fondo de pantalla con imagen desde una URL
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  // URL de la imagen de fondo
                  'https://img.freepik.com/vector-gratis/fondo-futurista-degradado-geometrico_23-2149116406.jpg',  
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Avatar con el logo de la UNAH desde una URL
                  const CircleAvatar(
                    backgroundImage: NetworkImage(
                      // URL del logo de la UNAH
                      'https://d26m4ikkajfmz.cloudfront.net/wp-content/uploads/2024/06/WhatsApp-Image-2024-06-19-at-4.11.26-PM-696x695.jpeg',
                    ),
                    radius: 50,
                  ),
                  const SizedBox(height: 20.0),

                  // Card de inicio de sesión
                  Card(
                    color: Colors.black38,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    elevation: 8,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Form(
                        key: formKey,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            // Campo Correo
                            CampoCorreo(
                              correoController: correoController,
                              focusNode: correoFocusNode,
                            ),
                            const SizedBox(height: 20),

                           // Campo de contraseña
                            PasswordInput(
                              passwordController: passwordController,
                              focusNode: passwordFocusNode,
                            ),
                            const SizedBox(height: 20),
                            
                            const SizedBox(height: 20.0),
                            ElevatedButton(
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  if (correoController.text == 'carguetar@unah.hn' &&
                                      passwordController.text == '20172001120') {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => HomePage(email: correoController.text),
                                      ),
                                    );
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text('Credenciales incorrectas'),
                                      ),
                                    );
                                  }
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.orange,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: const Text(
                                'Iniciar Sesión',
                                style: TextStyle(color: Colors.black),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            const SizedBox(height: 10.0),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => RegistroPage()),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blueAccent,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: const Text(
                                '¿Nuevo(a)? ¡Registrémonos!',
                                style: TextStyle(color: Colors.black),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

