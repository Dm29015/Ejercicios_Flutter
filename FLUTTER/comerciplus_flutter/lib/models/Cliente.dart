
 class Cliente {
  final int id;
  final String cedulaCliente;
  final String nombreCliente;
  final String apellidoCliente;
  final String direccionCliente;
  final String telefonoCliente;
  final String estadoCliente;

  Cliente({required this.id, required this.cedulaCliente,required this.nombreCliente, required this.apellidoCliente,required this.direccionCliente, required this.telefonoCliente, required this.estadoCliente });

  factory Cliente.fromJson(Map<String, dynamic> json) {
    return Cliente(
      id: json['id'],
      cedulaCliente: json['cedulaCliente'],
      nombreCliente: json['nombreCliente'],
      apellidoCliente: json['apellidoCliente'],
      direccionCliente: json['direccionCliente'],
      telefonoCliente: json['telefonoCliente'],
      estadoCliente: json['estadoCliente'],
    );
  }
 }