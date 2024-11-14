import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

//FocusNode class (Según lo que dice la página de Flutter)
//An object that can be used by a stateful widget to obtain the keyboard focus and to handle keyboard events.
//Yo lo utilizare para que se enfoque en el campo con el que estoy trabajando sin que
//me tire un error "global" con el resto de los campos.
class PasswordInput extends StatefulWidget {
  const PasswordInput({
    super.key,
    required this.passwordController,
    required this.focusNode,
  });

  final TextEditingController passwordController;
  final FocusNode focusNode;

  @override
  _PasswordInputState createState() => _PasswordInputState();
}

class _PasswordInputState extends State<PasswordInput> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.passwordController,
      focusNode: widget.focusNode,
      style: const TextStyle(color: Colors.white),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'La contraseña es obligatoria';
        }
        if (value.length < 8) {
          return 'La contraseña debe tener al menos 8 caracteres';
        }
        return null;
      },
      obscureText: _obscureText,
      decoration: InputDecoration(
        labelText: 'Contraseña',
        hintText: 'Debe ser tu número de cuenta',
        hintStyle: TextStyle(color: Colors.white.withOpacity(0.6)),
        labelStyle: const TextStyle(color: Colors.white),
        prefixIcon: const Icon(Icons.lock, color: Colors.white),
        suffixIcon: IconButton(
          icon: Icon(
            _obscureText ? Icons.visibility_off : Icons.visibility,
            color: Colors.white,
          ),
          onPressed: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(10.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}

class ConfirmPasswordInput extends StatefulWidget {
  const ConfirmPasswordInput({
    super.key,
    required this.confirmPasswordController,
    required this.focusNode,
  });

  final TextEditingController confirmPasswordController;
  final FocusNode focusNode;

  @override
  _ConfirmPasswordInputState createState() => _ConfirmPasswordInputState();
}

class _ConfirmPasswordInputState extends State<ConfirmPasswordInput> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.confirmPasswordController,
      focusNode: widget.focusNode,
      style: const TextStyle(color: Colors.white),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'La confirmación de contraseña es obligatoria';
        }
        return null;
      },
      obscureText: _obscureText,
      decoration: InputDecoration(
        labelText: 'Confirmar Contraseña',
        labelStyle: const TextStyle(color: Colors.white),
        prefixIcon: const Icon(Icons.lock, color: Colors.white),
        suffixIcon: IconButton(
          icon: Icon(
            _obscureText ? Icons.visibility_off : Icons.visibility,
            color: Colors.white,
          ),
          onPressed: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(10.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
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
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: 'Nombre',
        labelStyle: const TextStyle(color: Colors.white),
        prefixIcon: const Icon(Icons.person, color: Colors.white),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(10.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          _mostrarDialogo(context, 'El campo Nombre no puede estar vacío');
          return '';
        }
        if (value.length < 3) {
          _mostrarDialogo(context, 'El Nombre debe tener al menos 3 caracteres');
          return '';
        }
        return null;
      },
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
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: 'Apellido',
        labelStyle: const TextStyle(color: Colors.white),
        prefixIcon: const Icon(Icons.person, color: Colors.white),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(10.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(10.0),
        ),
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
      style: const TextStyle(color: Colors.white),
      validator: (value) {
        if (value == null || value.isEmpty) {
          _mostrarDialogo(context, 'El correo institucional es obligatorio');
          return 'Este campo es obligatorio';
        }

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
      decoration: InputDecoration(
        labelText: 'Correo Institucional',
        labelStyle: const TextStyle(color: Colors.white),
        prefixIcon: const Icon(Icons.email_rounded, color: Colors.white),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(10.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(10.0),
        ),
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
      style: const TextStyle(color: Colors.white),
      validator: (value) {
        if (value == null || value.isEmpty) {
          _mostrarDialogo(context, 'El número de teléfono es obligatorio');
          return 'Este campo es obligatorio';
        }

        if (value.length != 8 || (value[0] != '3' && value[0] != '9')) {
          _mostrarDialogo(context, 'El teléfono debe tener 8 dígitos y comenzar con 3 o 9');
          return 'Debe tener 8 dígitos y comenzar con 3 o 9';
        }
        
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
      decoration: InputDecoration(
        labelText: 'Teléfono',
        labelStyle: const TextStyle(color: Colors.white),
        prefixIcon: const Icon(Icons.phone, color: Colors.white),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(10.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}