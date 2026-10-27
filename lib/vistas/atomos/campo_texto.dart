
import 'package:flutter/material.dart';

// Átomo reutilizable para ingresar diferentes tipos de datos.
class CampoTexto extends StatefulWidget {
  final String etiqueta;
  final String pista;
  final TextEditingController controlador;
  final IconData icono;
  final bool esContrasena;
  final TextInputType teclado;

  const CampoTexto({
    super.key,
    required this.etiqueta,
    required this.controlador,
    required this.icono,
    this.pista = '',
    this.esContrasena = false,
    this.teclado = TextInputType.text,
  });

  @override
  State<CampoTexto> createState() => _CampoTextoState();
}

class _CampoTextoState extends State<CampoTexto> {
  bool ocultar = true;

  @override
  Widget build(BuildContext context) {
    final tema = Theme.of(context);

    return TextField(
      controller: widget.controlador,
      keyboardType: widget.teclado,

      // Oculta el texto únicamente cuando es una contraseña.
      obscureText: widget.esContrasena && ocultar,

      decoration: InputDecoration(
        labelText: widget.etiqueta,
        hintText: widget.pista,
        prefixIcon: Icon(widget.icono),

        filled: true,
        fillColor: tema.colorScheme.surface,

        // Permite mostrar u ocultar la contraseña.
        suffixIcon: widget.esContrasena
            ? IconButton(
          icon: Icon(
            ocultar ? Icons.visibility : Icons.visibility_off,
          ),
          onPressed: () {
            setState(() {
              ocultar = !ocultar;
            });
          },
        )
            : null,

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
        ),

        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 18,
        ),
      ),
    );
  }
}
