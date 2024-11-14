import 'package:flutter/material.dart';
import 'package:login_app/pages/login_page.dart';
import 'package:login_app/widgets/inputs.dart';

class RegistroPage extends StatelessWidget {
  RegistroPage({super.key});

  final TextEditingController nombreController = TextEditingController();
  final TextEditingController apellidoController = TextEditingController();
  final TextEditingController correoController = TextEditingController();
  final TextEditingController telefonoController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmarPasswordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  // Focus nodes para rastrear cada campo
  final FocusNode nombreFocusNode = FocusNode();
  final FocusNode apellidoFocusNode = FocusNode();
  final FocusNode correoFocusNode = FocusNode();
  final FocusNode telefonoFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();
  final FocusNode confirmPasswordFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Fondo de pantalla con imagen desde una URL
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  'https://img.freepik.com/fotos-premium/resumen-fondo-diseno-imagenes-fondos-pantalla-ai-generado_643360-81884.jpg',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 60),
                    
                    const Center(
                      child: Text(
                        'Registro de Usuario',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 30),

                    // Campo Nombre
                    CampoNombre(
                      nombreController: nombreController,
                      focusNode: nombreFocusNode,
                    ),
                    const SizedBox(height: 30),

                    // Campo Apellido
                    CampoApellido(
                      apellidoController: apellidoController,
                      focusNode: apellidoFocusNode,
                    ),
                    const SizedBox(height: 30),

                    // Campo Correo
                    CampoCorreo(
                      correoController: correoController,
                      focusNode: correoFocusNode,
                    ),
                    const SizedBox(height: 30),

                    // Campo Teléfono
                    CampoTelefono(
                      telefonoController: telefonoController,
                      focusNode: telefonoFocusNode,
                    ),
                    const SizedBox(height: 30),

                    
                    // Campo de contraseña
                    PasswordInput(
                      passwordController: passwordController,
                      focusNode: passwordFocusNode,
                    ),
                    const SizedBox(height: 30),

                    // Campo de contraseña
                    ConfirmPasswordInput(
                      confirmPasswordController: confirmarPasswordController,
                      focusNode: confirmPasswordFocusNode,
                    ),
                    const SizedBox(height: 30),

                    ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          if (passwordController.text != confirmarPasswordController.text) {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: const Text('Error'),
                                content: const Text('Las contraseñas no coinciden.'),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text('Aceptar'),
                                  ),
                                ],
                              ),
                            );
                          } else {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => LoginPage()),
                            );
                          }
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        foregroundColor: Colors.black,
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        elevation: 5,
                      ),
                      child: const Text(
                        '¡Registrarse!',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
