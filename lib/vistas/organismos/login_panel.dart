import 'package:flutter/material.dart';

import '../atomos/etiqueta.dart';
import '../moleculas/login_formulario.dart';

// Organismo: presenta el encabezado y el formulario de acceso.
class LoginPanel extends StatelessWidget {
  final TextEditingController usuarioController;
  final TextEditingController contrasenaController;
  final VoidCallback iniciarSesion;
  final VoidCallback limpiar;
  final String? mensajeError;

  const LoginPanel({
    super.key,
    required this.usuarioController,
    required this.contrasenaController,
    required this.iniciarSesion,
    required this.limpiar,
    this.mensajeError,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Icon(
              Icons.lan_outlined,
              size: 56,
              color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(height: 20),
            const Center(
              child: Etiqueta(texto: 'Inicio de sesión', esTitulo: true),
            ),
            const SizedBox(height: 8),
            DefaultTextStyle.merge(
              textAlign: TextAlign.center,
              child: const Etiqueta(
                texto: 'Accede para utilizar la calculadora de subredes.',
              ),
            ),
            const SizedBox(height: 24),
            LoginFormulario(
              usuarioController: usuarioController,
              contrasenaController: contrasenaController,
              iniciarSesion: iniciarSesion,
              limpiar: limpiar,
              mensajeError: mensajeError,
            ),
          ],
        ),
      ),
    );
  }
}
