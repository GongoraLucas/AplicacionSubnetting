
import 'package:flutter/material.dart';

// Átomo para mostrar títulos, etiquetas y mensajes.
class Etiqueta extends StatelessWidget {
  final String texto;
  final bool esTitulo;
  final Color? color;

  const Etiqueta({
    super.key,
    required this.texto,
    this.esTitulo = false,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final tema = Theme.of(context);

    return Text(
      texto,
      style: esTitulo
          ? tema.textTheme.titleLarge?.copyWith(
        fontWeight: FontWeight.bold,
        color: color ?? tema.colorScheme.onSurface,
      )
          : tema.textTheme.bodyMedium?.copyWith(
        color: color ?? tema.colorScheme.onSurfaceVariant,
      ),
    );
  }
}
