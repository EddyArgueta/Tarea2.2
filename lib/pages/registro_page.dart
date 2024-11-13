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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registro de Usuario'),
      ),
      backgroundColor: const Color.fromARGB(255, 252, 250, 166),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Campo Nombre
                CampoNombre(
                  nombreController: nombreController,
                  focusNode: nombreFocusNode,
                ),

                // Campo Apellido
                const SizedBox(height: 20),
                CampoApellido(
                  apellidoController: apellidoController,
                  focusNode: apellidoFocusNode,
                ),

                // Campo Correo
                const SizedBox(height: 20),
                CampoCorreo(
                  correoController: correoController,
                  focusNode: correoFocusNode,
                ),

                // Campo Teléfono
                const SizedBox(height: 20),
                CampoTelefono(
                  telefonoController: telefonoController,
                  focusNode: telefonoFocusNode,
                ),

                // Campo Contraseña
                const SizedBox(height: 20),
                PasswordCustomInput(
                  passwordController: passwordController,
                  confirmPasswordController: confirmarPasswordController,
                  focusNode: passwordFocusNode,
                ),

                const SizedBox(height: 20),

                // Botón de Registro
                ElevatedButton(
                  onPressed: () {
                    // Al presionar el botón, se verifica que el formulario esté completo y correcto
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();

                      // Navegación a la pantalla de inicio de sesión
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      );
                    } else {
                      // Muestra un mensaje si hay campos que aún son inválidos
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text('Error'),
                          content: const Text('Por favor, complete todos los campos correctamente.'),
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
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: const BorderSide(color: Colors.deepOrange),
                    ),
                  ),
                  child: const Text('¡Registrar!'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}





