import 'package:flutter/material.dart';

import '../atomos/campo_texto.dart';
import '../atomos/boton.dart';
import '../atomos/etiqueta.dart';

// Molécula: reúne los campos y acciones del inicio de sesión.
class LoginFormulario extends StatelessWidget {
  final TextEditingController usuarioController;
  final TextEditingController contrasenaController;
  final VoidCallback iniciarSesion;
  final VoidCallback limpiar;
  final String? mensajeError;

  const LoginFormulario({
    super.key,
    required this.usuarioController,
    required this.contrasenaController,
    required this.iniciarSesion,
    required this.limpiar,
    this.mensajeError,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        CampoTexto(
          etiqueta: 'Usuario',
          pista: 'Ingresa tu usuario',
          icono: Icons.person_outline,
          controlador: usuarioController,
        ),
        const SizedBox(height: 14),
        CampoTexto(
          etiqueta: 'Contraseña',
          pista: 'Ingresa tu contraseña',
          icono: Icons.lock_outline,
          controlador: contrasenaController,
          esContrasena: true,
        ),
        if (mensajeError != null) ...[
          const SizedBox(height: 14),
          Semantics(
            liveRegion: true,
            child: Etiqueta(
              texto: mensajeError!,
              color: Theme.of(context).colorScheme.error,
            ),
          ),
        ],
        const SizedBox(height: 20),
        Boton(
          texto: 'Iniciar sesión',
          alPresionar: iniciarSesion,
        ),
        const SizedBox(height: 12),
        Boton(
          texto: 'Limpiar',
          icono: Icons.refresh,
          principal: false,
          alPresionar: limpiar,
        ),
      ],
    );
  }
}
