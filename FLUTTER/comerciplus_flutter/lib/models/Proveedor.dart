// import 'dart:convert';
// import 'package:http/http.dart' as http;

 class Proveedor {
  final String nit;
  final String nombreProveedor;
  final String telefonoProveedor;
  final String direccionProveedor;
  final String nombreVendedor;

  Proveedor({required this.nit, required this.nombreProveedor, required this.telefonoProveedor, required this.direccionProveedor, required this.nombreVendedor });

  factory Proveedor.fromJson(Map<String, dynamic> json) {
    return Proveedor(
      nit: json['nit'],
      nombreProveedor: json['nombreEmpresa'],
      telefonoProveedor: json['telefonoEmpresa'],
      direccionProveedor: json['direccionEmpresa'],
      nombreVendedor: json['nombreVendedor'],
    );
  }
 }