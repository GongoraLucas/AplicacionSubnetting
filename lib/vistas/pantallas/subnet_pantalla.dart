
import 'package:flutter/material.dart';
import '../../controladores/subnet_controlador.dart';
import '../../modelos/ipv4_modelo.dart';
import '../../modelos/subnet_modelo.dart';
import '../organismos/subnet_panel.dart';

// Pantalla: recibe datos y consulta al controlador de la Persona 1.
class SubnetPantalla extends StatefulWidget {
  const SubnetPantalla({super.key});

  @override
  State<SubnetPantalla> createState() => _SubnetPantallaState();
}

class _SubnetPantallaState extends State<SubnetPantalla> {
  final ipController = TextEditingController();
  final cidrController = TextEditingController();
  final controlador = SubnetControlador();

  SubnetModelo? resultado;
  String mensaje = '';

  void calcular() {
    final ip = ipController.text.trim();
    final textoCidr = cidrController.text.trim();

    final cidr = int.tryParse(
      textoCidr.startsWith('/')
          ? textoCidr.substring(1)
          : textoCidr,
    );

    // Se usan las validaciones del compañero, no se duplican.
    if (!controlador.validarIp(ip)) {
      setState(() {
        mensaje = 'Ingresa una dirección IPv4 válida.';
        resultado = null;
      });
      return;
    }

    if (cidr == null || !controlador.validarCidr(cidr)) {
      setState(() {
        mensaje = 'El prefijo CIDR debe estar entre 0 y 32.';
        resultado = null;
      });
      return;
    }

    // El controlador calcula; la vista solo muestra su resultado.
    final datos = controlador.calcular(
      Ipv4Modelo(ip: ip, cidr: cidr),
    );

    setState(() {
      resultado = datos;
      mensaje = datos == null
          ? 'No se pudo calcular la red.'
          : '';
    });

    FocusScope.of(context).unfocus();
  }

  // Borra entradas, mensajes y resultados.
  void limpiar() {
    setState(() {
      ipController.clear();
      cidrController.clear();
      resultado = null;
      mensaje = '';
    });

    FocusScope.of(context).unfocus();
  }

  @override
  void dispose() {
    ipController.dispose();
    cidrController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora de Subredes'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          SubnetPanel(
            ipController: ipController,
            cidrController: cidrController,
            calcular: calcular,
            limpiar: limpiar,
            resultado: resultado,
            mensaje: mensaje,
          ),
        ],
      ),
    );
  }
}
