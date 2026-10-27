
import 'package:flutter/material.dart';
import '../atomos/campo_texto.dart';
import '../atomos/boton.dart';
import '../atomos/etiqueta.dart';

// Molécula: reúne los átomos para ingresar IP y CIDR.
class SubnetFormulario extends StatelessWidget {
  final TextEditingController ipController;
  final TextEditingController cidrController;
  final VoidCallback calcular;
  final VoidCallback limpiar;

  const SubnetFormulario({
    super.key,
    required this.ipController,
    required this.cidrController,
    required this.calcular,
    required this.limpiar,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Etiqueta(
          texto: 'Ingresa una dirección IPv4 y su prefijo CIDR.',
        ),
        const SizedBox(height: 18),

        // Átomo reutilizable para ingresar IPv4.
        CampoTexto(
          etiqueta: 'Dirección IPv4',
          pista: '192.168.1.130',
          icono: Icons.language,
          controlador: ipController,
          teclado: const TextInputType.numberWithOptions(
            decimal: true,
          ),
        ),

        const SizedBox(height: 14),

        // El mismo átomo para ingresar el prefijo CIDR.
        CampoTexto(
          etiqueta: 'Prefijo CIDR',
          pista: 'Ejemplo: 26',
          icono: Icons.numbers,
          controlador: cidrController,
          teclado: TextInputType.number,
        ),

        const SizedBox(height: 20),

        Row(
          children: [
            Expanded(
              child: Boton(
                texto: 'Calcular',
                icono: Icons.calculate_outlined,
                alPresionar: calcular,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Boton(
                texto: 'Limpiar',
                icono: Icons.refresh,
                principal: false,
                alPresionar: limpiar,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

// Molécula reutilizable para mostrar cada resultado.
class SubnetResultadoItem extends StatelessWidget {
  final String titulo;
  final String valor;

  const SubnetResultadoItem({
    super.key,
    required this.titulo,
    required this.valor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Expanded(child: Etiqueta(texto: titulo)),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              valor,
              textAlign: TextAlign.end,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
