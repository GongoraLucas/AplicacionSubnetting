
import 'package:flutter/material.dart';

// Átomo reutilizable para las acciones de la aplicación.
class Boton extends StatelessWidget {
  final String texto;
  final VoidCallback alPresionar;
  final IconData? icono;
  final bool principal;

  const Boton({
    super.key,
    required this.texto,
    required this.alPresionar,
    this.icono,
    this.principal = true,
  });

  @override
  Widget build(BuildContext context) {
    // Contenido compartido entre los dos tipos de botones.
    final contenido = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (icono != null) ...[
          Icon(icono, size: 20),
          const SizedBox(width: 8),
        ],
        Text(
          texto,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
      ],
    );

    return SizedBox(
      height: 50,
      width: double.infinity,

      // El botón principal destaca; el secundario tiene borde.
      child: principal
          ? FilledButton(
        onPressed: alPresionar,
        child: contenido,
      )
          : OutlinedButton(
        onPressed: alPresionar,
        child: contenido,
      ),
    );
  }
}
