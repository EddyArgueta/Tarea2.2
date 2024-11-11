import 'package:flutter/material.dart';

class PasswordCustomInput extends StatefulWidget {
  const PasswordCustomInput({super.key, required this.controller});

  final TextEditingController controller;

  @override
  State<PasswordCustomInput> createState() => _PasswordCustomInputState();
}

class _PasswordCustomInputState extends State<PasswordCustomInput> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: (value) {
        if (value!.isEmpty) {
          return 'La Contraseña es Obligatoria';
        }

        if (value.length != 11) {
          return 'La Contraseña debe tener exactamente 11 caracteres';
        }

        // Tenemos que verificar que solo sean numeros, ya que es el No. de Cuenta lo que necesitamos
        for (int i = 0; i < value.length; i++) {
          if (int.tryParse(value[i]) == null) {
          return 'La Contraseña debe contener solo números';
        }
      }
        return null;
      },
      keyboardType: TextInputType.text,
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
    );
  }
}
