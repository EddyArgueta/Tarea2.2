import 'package:flutter/material.dart';
import 'package:login_app/pages/login_page.dart';
import 'package:login_app/widgets/inputs.dart';

class RegistroPage extends StatelessWidget {
  RegistroPage({Key? key}) : super(key: key);

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
                TextFormField(
                  controller: nombreController,
                  maxLength: 30,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'El nombre es obligatorio';
                    }
                    
                    //Proceso inverso a la contraseña
                    for (int i = 0; i < value.length; i++) {
                     if (int.tryParse(value[i]) != null) {
                    return 'El Nombre debe contener solo letras';
                    }
                  }
                    return null;
                  },
                  keyboardType: TextInputType.name,
                      decoration: const InputDecoration(
                        labelText: 'Nombre',
                        prefixIcon: Icon(Icons.person),
                        border: OutlineInputBorder(),
                ),
                ),

                //Apellido
                const SizedBox(height: 20),
                TextFormField(
                  controller: apellidoController,
                  maxLength: 30,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'El apellido es obligatorio';
                    }

                    //Proceso inverso a la contraseña
                    for (int i = 0; i < value.length; i++) {
                     if (int.tryParse(value[i]) != null) {
                    return 'El Apellido debe contener solo letras';
                    }
                  }
                    return null;
                  },
                  keyboardType: TextInputType.name,
                      decoration: const InputDecoration(
                        labelText: 'Apellido',
                        prefixIcon: Icon(Icons.person),
                        border: OutlineInputBorder(),
                ),
                ),

                //Correo
                const SizedBox(height: 20),
                TextFormField(
                  controller: correoController,
                  maxLength: 50,
                  validator: (value) {
                    if (value!.isEmpty) {
                          return 'El Correo Institucional es Obligatorio';
                        }

                        if (!value.contains('@unah.hn')) {
                          return 'Por favor ingresa un correo electrónico válido de la UNAH';
                        }

                        if (value.length < 3) {
                          return 'El Correo debe de tener más de 3 Caracteres';
                        }
                    return null;
                  },
                  keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        labelText: 'Correo Institucional',
                        prefixIcon: Icon(Icons.email_rounded),
                        border: OutlineInputBorder(),
                ),
                ),

                //Numero de Telefono
                const SizedBox(height: 20),
                TextFormField(
                  controller: telefonoController,
                  maxLength: 15,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'El Número de Teléfono es obligatorio';
                    }

                    for (int i = 0; i < value.length; i++) {
                     if (int.tryParse(value[i]) == null) {
                    return 'El Número de Teléfono debe contener solo números';
                    }
                  }
                    return null;
                  },
                  keyboardType: TextInputType.phone,
                      decoration: const InputDecoration(
                        labelText: 'Teléfono',
                        prefixIcon: Icon(Icons.phone),
                        border: OutlineInputBorder(),
                ),
                ),

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
