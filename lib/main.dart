import 'package:flutter/material.dart';

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
        '/': (context) => const Placeholder(), // Cambiar PlaceHolder por Pantalla 1: Login (Encargado Persona 2/3)
        '/calculadora': (context) => const Placeholder(), // Cambiar PlaceHolder por  Pantalla 2: Formulario Calculadora
        '/resultado': (context) => const Placeholder(), // Cambiar PlaceHolder por  Pantalla 3: Resultado de la Red
      },
    );
  }
}