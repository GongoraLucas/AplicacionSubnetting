class SubnetModelo {
  final String ip;
  final int cidr;
  final int bitsHost;
  final int totalDirecciones;
  final int hostsUtilizables;
  final String mascara;
  final String direccionRed;
  final String broadcast;
  final String primeraIpUtilizable;
  final String ultimaIpUtilizable;
  final String rangoHosts;
  final int saltoSubred;

  SubnetModelo({
    required this.ip,
    required this.cidr,
    required this.bitsHost,
    required this.totalDirecciones,
    required this.hostsUtilizables,
    required this.mascara,
    required this.direccionRed,
    required this.broadcast,
    required this.primeraIpUtilizable,
    required this.ultimaIpUtilizable,
    required this.rangoHosts,
    required this.saltoSubred,
  });
}