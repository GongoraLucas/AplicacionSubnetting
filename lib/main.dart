import 'package:flutter/material.dart';
import 'package:subnetting/vistas/pantallas/subnet_pantalla.dart';
import 'vistas/pantallas/login_pantalla.dart';
import 'vistas/pantallas/inicio_pantalla.dart';

void main() {
  runApp(const MiApp());
}

class MiApp extends StatelessWidget {
  const MiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora de Subredes',
      debugShowCheckedModeBanner: false,

      // Tema de la aplicación
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          primary: Colors.blue,
          secondary: Colors.indigo,
        ),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(fontSize: 16),
          titleLarge: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          filled: true,
          fillColor: Colors.grey.shade100,
        ),
      ),

      // Definición de Rutas
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginPantalla(),
        '/inicio': (context) => const InicioPantalla(),
        // Pendiente: conectar la pantalla de calculadora de la persona 2.
        '/calculadora': (context) => const SubnetPantalla(),
      },
    );
  }
}