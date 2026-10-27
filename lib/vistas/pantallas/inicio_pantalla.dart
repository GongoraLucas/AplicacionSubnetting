import 'package:flutter/material.dart';

import '../atomos/boton.dart';
import '../atomos/etiqueta.dart';

class InicioPantalla extends StatelessWidget {
  const InicioPantalla({super.key});

  @override
  Widget build(BuildContext context) {
    final argumento = ModalRoute.of(context)?.settings.arguments;
    final usuario = argumento is String ? argumento : 'usuario';

    return Scaffold(
      appBar: AppBar(title: const Text('Inicio'), centerTitle: true),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 480),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Center(
                        child: Etiqueta(
                          texto: 'Bienvenido, $usuario',
                          esTitulo: true,
                        ),
                      ),
                      const SizedBox(height: 12),
                      DefaultTextStyle.merge(
                        textAlign: TextAlign.center,
                        child: const Etiqueta(
                          texto:
                              'Calcula la información de una red a partir '
                              'de su dirección IPv4 y prefijo CIDR.',
                        ),
                      ),
                      const SizedBox(height: 24),
                      Boton(
                        texto: 'Calculadora',
                        icono: Icons.calculate_outlined,
                        alPresionar: () =>
                            Navigator.pushNamed(context, '/calculadora'),
                      ),
                      const SizedBox(height: 12),
                      Boton(
                        texto: 'Cerrar sesión',
                        icono: Icons.logout,
                        principal: false,
                        alPresionar: () => Navigator.pushNamedAndRemoveUntil(
                          context,
                          '/',
                          (ruta) => false,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
