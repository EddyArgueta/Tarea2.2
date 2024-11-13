import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class PasswordCustomInput extends StatefulWidget {
  const PasswordCustomInput({
    super.key,
    required this.passwordController,
    required this.confirmPasswordController,
    required this.focusNode, 
  });

  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final FocusNode focusNode;

  @override
  _PasswordCustomInputState createState() => _PasswordCustomInputState();
}

class _PasswordCustomInputState extends State<PasswordCustomInput> {
  bool _obscureText = true;

  // Método para validar si las contraseñas coinciden
  bool _validatePasswordsMatch() {
    return widget.passwordController.text == widget.confirmPasswordController.text;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Campo de contraseña
        TextFormField(
          controller: widget.passwordController,
          focusNode: widget.focusNode,
          validator: (value) {
            if (value!.isEmpty) {
              return 'La contraseña es obligatoria';
            }
            if (value.length < 8) {
              return 'La contraseña debe tener al menos 8 caracteres';
            }
            if (!RegExp(r'[A-Z]').hasMatch(value)) {
              return 'La contraseña debe contener al menos una letra mayúscula';
            }
            if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
              return 'La contraseña debe contener al menos un carácter especial';
            }
            return null;
          },
          obscureText: _obscureText,
          decoration: InputDecoration(
            labelText: 'Contraseña',
            prefixIcon: const Icon(Icons.lock),
            suffixIcon: IconButton(
              icon: Icon(_obscureText ? Icons.visibility_off : Icons.visibility),
              color: _obscureText ? Colors.grey : Colors.blue,
              onPressed: () {
                setState(() {
                  _obscureText = !_obscureText;
                });
              },
            ),
            border: const OutlineInputBorder(),
          ),
        ),
        
        const SizedBox(height: 20),

        // Campo de confirmación de contraseña
        TextFormField(
          controller: widget.confirmPasswordController,
          focusNode: widget.focusNode,
          obscureText: _obscureText,
          decoration: InputDecoration(
            labelText: 'Confirmar Contraseña',
            prefixIcon: const Icon(Icons.lock),
            suffixIcon: IconButton(
              icon: Icon(_obscureText ? Icons.visibility_off : Icons.visibility),
              color: _obscureText ? Colors.grey : Colors.blue,
              onPressed: () {
                setState(() {
                  _obscureText = !_obscureText;
                });
              },
            ),
            border: const OutlineInputBorder(),
          ),
        ),
        
        const SizedBox(height: 16),
        
        // Botón para mostrar datos en consola, si las contraseñas coinciden
        ElevatedButton(
          onPressed: () {
            if (_validatePasswordsMatch()) {
              // Aquí se muestran los datos en consola
              print("Contraseña: ${widget.passwordController.text}");
              print("Confirmación de Contraseña: ${widget.confirmPasswordController.text}");
            } else {
              // Si las contraseñas no coinciden, muestra un pop-up de error
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
            }
          },
          child: const Text('Mostrar datos'),
        ),
      ],
    );
  }
}

class CampoNombre extends StatelessWidget {
  const CampoNombre({
    super.key,
    required this.nombreController,
    required this.focusNode, 
  });

  final TextEditingController nombreController;
  final FocusNode focusNode;

  void _mostrarDialogo(BuildContext context, String mensaje) {
    //SchedulerBinding.addPostFrameCallback: Este método asegura que el SnackBar y el diálogo solo se muestren 
    //después de que el widget haya sido construido completamente, evitando el error de construcción.
    SchedulerBinding.instance.addPostFrameCallback((_) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Error en el Nombre'),
          content: Text(mensaje),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cerrar'),
            ),
          ],
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: nombreController,
      focusNode: focusNode,
      maxLength: 10,
      validator: (value) {
        if (value == null || value.isEmpty) {
          _mostrarDialogo(context, 'El nombre es obligatorio');
          return 'Este campo es obligatorio';
        }

        if (value.length < 3 || value.length > 10) {
          _mostrarDialogo(context, 'El nombre debe tener entre 3 y 10 caracteres.');
          return 'Debe tener entre 3 y 10 caracteres';
        }

        if (value.contains(RegExp(r'\d'))) {
          _mostrarDialogo(context, 'El nombre debe contener solo letras');
          return 'Debe contener solo letras';
        }

        return null;
      },
      keyboardType: TextInputType.name,
      decoration: const InputDecoration(
        labelText: 'Nombre',
        prefixIcon: Icon(Icons.person),
        border: OutlineInputBorder(),
      ),
    );
  }
}


class CampoApellido extends StatelessWidget {
  const CampoApellido({
    super.key,
    required this.apellidoController,
    required this.focusNode, 
  });

  final TextEditingController apellidoController;
  final FocusNode focusNode;

  void _mostrarDialogo(BuildContext context, String mensaje) {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Error en el Apellido'),
          content: Text(mensaje),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cerrar'),
            ),
          ],
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: apellidoController,
      focusNode: focusNode,
      maxLength: 30,
      validator: (value) {
        if (value == null || value.isEmpty) {
          _mostrarDialogo(context, 'El apellido es obligatorio');
          return 'Este campo es obligatorio';
        }

        if (value.length < 3 || value.length > 10) {
          _mostrarDialogo(context, 'El apellido debe tener entre 3 y 10 caracteres.');
          return 'Debe tener entre 3 y 10 caracteres';
        }

        if (value.contains(RegExp(r'\d'))) {
          _mostrarDialogo(context, 'El apellido debe contener solo letras');
          return 'Debe contener solo letras';
        }

        return null;
      },
      keyboardType: TextInputType.name,
      decoration: const InputDecoration(
        labelText: 'Apellido',
        prefixIcon: Icon(Icons.person),
        border: OutlineInputBorder(),
      ),
    );
  }
}

class CampoCorreo extends StatelessWidget {
  const CampoCorreo({
    super.key,
    required this.correoController,
    required this.focusNode, 
  });

  final TextEditingController correoController;
  final FocusNode focusNode;

  void _mostrarDialogo(BuildContext context, String mensaje) {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Error en el Correo Institucional'),
          content: Text(mensaje),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cerrar'),
            ),
          ],
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: correoController,
      focusNode: focusNode,
      maxLength: 50,
      validator: (value) {
        if (value == null || value.isEmpty) {
          _mostrarDialogo(context, 'El correo institucional es obligatorio');
          return 'Este campo es obligatorio';
        }

        // Validación de formato y dominio del correo

        //^[\w-]+: La parte inicial ^[\w-]+ indica que el correo debe comenzar con letras (a-z o A-Z),
        //números (0-9), guiones (-), o puntos (.). Esta secuencia es válida para la parte antes del @.
        //(\.[\w-]+)*: Permite opcionalmente tener puntos adicionales antes del @.
        //@unah\.edu\.hn$|@unah\.hn$: La última parte especifica que el correo debe finalizar en
        //@unah.edu.hn o @unah.hn, asegurando que es un correo de la universidad.
        final correoExpresion = RegExp(r"^[\w-]+(\.[\w-]+)*@unah\.edu\.hn$|^[\w-]+(\.[\w-]+)*@unah\.hn$");
        if (!correoExpresion.hasMatch(value)) {
          _mostrarDialogo(context, 
          'Por favor, ingresa un correo válido de la UNAH (debe terminar en unah.edu.hn o unah.hn)');
          return 'Debe ser un correo institucional válido';
        }

        return null;
      },
      keyboardType: TextInputType.emailAddress,
      decoration: const InputDecoration(
        labelText: 'Correo Institucional',
        prefixIcon: Icon(Icons.email_rounded),
        border: OutlineInputBorder(),
      ),
    );
  }
}

class CampoTelefono extends StatelessWidget {
  const CampoTelefono({
    super.key,
    required this.telefonoController,
    required this.focusNode, 
  });

  final TextEditingController telefonoController;
  final FocusNode focusNode;

  void _mostrarDialogo(BuildContext context, String mensaje) {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Error en el Teléfono'),
          content: Text(mensaje),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cerrar'),
            ),
          ],
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: telefonoController,
      focusNode: focusNode,
      maxLength: 8,
      validator: (value) {
        if (value == null || value.isEmpty) {
          _mostrarDialogo(context, 'El número de teléfono es obligatorio');
          return 'Este campo es obligatorio';
        }

        // Validación de longitud y primer dígito
        if (value.length != 8 || (value[0] != '3' && value[0] != '9')) {
          _mostrarDialogo(context, 'El teléfono debe tener 8 dígitos y comenzar con 3 o 9');
          return 'Debe tener 8 dígitos y comenzar con 3 o 9';
        }

        // Validación de que solo contenga números

        //^\d+$: Esta expresión indica que el valor debe contener solo dígitos (\d), 
        //y el signo ^ al inicio y $ al final aseguran que
        //no haya caracteres adicionales antes o después del número.
        if (!RegExp(r'^\d+$').hasMatch(value)) {
          _mostrarDialogo(context, 'El teléfono debe contener solo números');
          return 'Debe contener solo números';
        }

        return null;
      },
      keyboardType: TextInputType.phone,
      decoration: const InputDecoration(
        labelText: 'Teléfono',
        prefixIcon: Icon(Icons.phone),
        border: OutlineInputBorder(),
      ),
    );
  }
}
