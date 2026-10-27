
import 'package:flutter/material.dart';
import '../../modelos/subnet_modelo.dart';
import '../atomos/etiqueta.dart';
import '../moleculas/subnet_formulario.dart';

// Organismo: integra formulario y resultados sin hacer cálculos.
class SubnetPanel extends StatelessWidget {
  final TextEditingController ipController;
  final TextEditingController cidrController;
  final VoidCallback calcular;
  final VoidCallback limpiar;
  final SubnetModelo? resultado;
  final String mensaje;

  const SubnetPanel({
    super.key,
    required this.ipController,
    required this.cidrController,
    required this.calcular,
    required this.limpiar,
    required this.resultado,
    required this.mensaje,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Tarjeta principal con el formulario.
        Card(
          child: Padding(
            padding: const EdgeInsets.all(18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Etiqueta(
                  texto: 'Configuración de red',
                  esTitulo: true,
                ),
                const SizedBox(height: 14),
                SubnetFormulario(
                  ipController: ipController,
                  cidrController: cidrController,
                  calcular: calcular,
                  limpiar: limpiar,
                ),
              ],
            ),
          ),
        ),

        // Mensajes de validación.
        if (mensaje.isNotEmpty) ...[
          const SizedBox(height: 12),
          Etiqueta(
            texto: mensaje,
            color: Theme.of(context).colorScheme.error,
          ),
        ],

        // Los resultados aparecen después de calcular.
        if (resultado != null) ...[
          const SizedBox(height: 18),

          Card(
            child: Padding(
              padding: const EdgeInsets.all(18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Etiqueta(
                    texto: 'Resultados de la subred',
                    esTitulo: true,
                  ),
                  const Divider(height: 24),

                  SubnetResultadoItem(
                    titulo: 'IP ingresada',
                    valor: resultado!.ip,
                  ),
                  SubnetResultadoItem(
                    titulo: 'Prefijo CIDR',
                    valor: '/${resultado!.cidr}',
                  ),
                  SubnetResultadoItem(
                    titulo: 'Máscara',
                    valor: resultado!.mascara,
                  ),
                  SubnetResultadoItem(
                    titulo: 'Dirección de red',
                    valor: resultado!.direccionRed,
                  ),
                  SubnetResultadoItem(
                    titulo: 'Broadcast',
                    valor: resultado!.broadcast,
                  ),
                  SubnetResultadoItem(
                    titulo: 'Bits de host',
                    valor: '${resultado!.bitsHost}',
                  ),
                  SubnetResultadoItem(
                    titulo: 'Total de direcciones',
                    valor: '${resultado!.totalDirecciones}',
                  ),
                  SubnetResultadoItem(
                    titulo: 'Hosts utilizables',
                    valor: '${resultado!.hostsUtilizables}',
                  ),
                  SubnetResultadoItem(
                    titulo: 'Primera IP utilizable',
                    valor: resultado!.hostsUtilizables > 0
                        ? resultado!.primeraIpUtilizable
                        : 'No aplica',
                  ),
                  SubnetResultadoItem(
                    titulo: 'Última IP utilizable',
                    valor: resultado!.hostsUtilizables > 0
                        ? resultado!.ultimaIpUtilizable
                        : 'No aplica',
                  ),
                  SubnetResultadoItem(
                    titulo: 'Rango de hosts',
                    valor: resultado!.hostsUtilizables > 0
                        ? resultado!.rangoHosts
                        : 'Sin hosts utilizables',
                  ),
                  SubnetResultadoItem(
                    titulo: 'Salto de subred',
                    valor: resultado!.cidr >= 25
                        ? '${resultado!.saltoSubred}'
                        : 'No aplica',
                  ),
                ],
              ),
            ),
          ),
        ],
      ],
    );
  }
}
