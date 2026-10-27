import 'package:flutter/material.dart';

import '../../controladores/login_controlador.dart';
import '../../modelos/usuario_modelo.dart';
import '../organismos/login_panel.dart';

class LoginPantalla extends StatefulWidget {
  const LoginPantalla({super.key});

  @override
  State<LoginPantalla> createState() => _LoginPantallaState();
}

class _LoginPantallaState extends State<LoginPantalla> {
  final usuarioController = TextEditingController();
  final contrasenaController = TextEditingController();
  final loginControlador = LoginControlador();
  String? mensajeError;

  void iniciarSesion() {
    FocusScope.of(context).unfocus();
    final entrada = UsuarioModelo(
      usuario: usuarioController.text,
      contrasena: contrasenaController.text,
    );
    final error = loginControlador.validar(entrada);
    setState(() => mensajeError = error);
    if (error == null) {
      Navigator.pushReplacementNamed(
        context,
        '/inicio',
        arguments: entrada.usuario.trim(),
      );
    }
  }

  void limpiar() {
    usuarioController.clear();
    contrasenaController.clear();
    setState(() => mensajeError = null);
    FocusScope.of(context).unfocus();
  }

  @override
  void dispose() {
    usuarioController.dispose();
    contrasenaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 480),
              child: LoginPanel(
                usuarioController: usuarioController,
                contrasenaController: contrasenaController,
                iniciarSesion: iniciarSesion,
                limpiar: limpiar,
                mensajeError: mensajeError,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
