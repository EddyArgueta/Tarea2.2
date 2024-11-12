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


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registro de Usuario'),
      ),
      backgroundColor:const Color.fromARGB(255, 252, 250, 166),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                //Nombre
                CampoNombre(nombreController: nombreController),

                //Apellido
                const SizedBox(height: 20),
                CampoApellido(apellidoController: apellidoController),

                //Correo
                const SizedBox(height: 20),
                CampoCorreo(correoController: correoController),

                //Numero de Telefono
                const SizedBox(height: 20),
                CampoTelefono(telefonoController: telefonoController),

                //Password 
                const SizedBox(height: 30),
                PasswordCustomInput(controller: passwordController),

                const Text('Recuerda que la Contraseña debe ser tu No. de Cuenta'),

                //Confirmar Password
                const SizedBox(height: 20),
                PasswordCustomInput(controller: confirmarPasswordController),

                
                const SizedBox(height: 20),
                ElevatedButton(
                    onPressed: () {       
                    formKey.currentState!.validate();
                    formKey.currentState!.save();
    
                    // Navegamos a la pantalla de registro
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                  );
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





