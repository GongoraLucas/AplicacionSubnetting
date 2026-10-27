import 'dart:math';
import '../modelos/ipv4_modelo.dart';
import '../modelos/subnet_modelo.dart';

class SubnetControlador {
  // Validación de la dirección IPv4
  bool validarIp(String ip) {
    var partes = ip.split('.');
    if (partes.length != 4) return false;

    for (var parte in partes) {
      var numero = int.tryParse(parte);
      if (numero == null || numero < 0 || numero > 255) {
        return false;
      }
    }
    return true;
  }

  // Validación del prefijo CIDR (0 a 32)
  bool validarCidr(int cidr) {
    return cidr >= 0 && cidr <= 32;
  }

  // Conversión de IP a entero de 32 bits para operaciones bit a bit
  int _ipAEntero(String ip) {
    var partes = ip.split('.').map(int.parse).toList();
    return (partes[0] << 24) | (partes[1] << 16) | (partes[2] << 8) | partes[3];
  }

  // Conversión de entero de 32 bits a formato string IP
  String _enteroAIp(int numero) {
    var octeto1 = (numero >> 24) & 255;
    var octeto2 = (numero >> 16) & 255;
    var octeto3 = (numero >> 8) & 255;
    var octeto4 = numero & 255;
    return '$octeto1.$octeto2.$octeto3.$octeto4';
  }

  // Método principal para calcular el subnetting
  SubnetModelo? calcular(Ipv4Modelo entrada) {
    if (!validarIp(entrada.ip) || !validarCidr(entrada.cidr)) {
      return null;
    }

    var cidr = entrada.cidr;
    var bitsHost = 32 - cidr;
    var totalDirecciones = pow(2, bitsHost).toInt();
    var hostsUtilizables = bitsHost >= 2 ? totalDirecciones - 2 : 0;

    // Máscara de subred
    var mascaraEntero = cidr == 0 ? 0 : (0xFFFFFFFF << (32 - cidr)) & 0xFFFFFFFF;
    var mascara = _enteroAIp(mascaraEntero);

    // Dirección de red y broadcast
    var ipEntero = _ipAEntero(entrada.ip);
    var redEntero = ipEntero & mascaraEntero;
    var broadcastEntero = redEntero + totalDirecciones - 1;

    var direccionRed = _enteroAIp(redEntero);
    var broadcast = _enteroAIp(broadcastEntero);

    // IPs utilizables y rango
    var primeraIpUtilizable = hostsUtilizables > 0 ? _enteroAIp(redEntero + 1) : direccionRed;
    var ultimaIpUtilizable = hostsUtilizables > 0 ? _enteroAIp(broadcastEntero - 1) : broadcast;
    var rangoHosts = '$primeraIpUtilizable - $ultimaIpUtilizable';

    // Salto de subred
    var partesMascara = mascara.split('.').map(int.parse).toList();
    var saltoSubred = 256 - partesMascara[3];

    return SubnetModelo(
      ip: entrada.ip,
      cidr: cidr,
      bitsHost: bitsHost,
      totalDirecciones: totalDirecciones,
      hostsUtilizables: hostsUtilizables,
      mascara: mascara,
      direccionRed: direccionRed,
      broadcast: broadcast,
      primeraIpUtilizable: primeraIpUtilizable,
      ultimaIpUtilizable: ultimaIpUtilizable,
      rangoHosts: rangoHosts,
      saltoSubred: saltoSubred,
    );
  }
}