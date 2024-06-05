// import 'dart:convert';
// import 'package:http/http.dart' as http;

 class Departamento {
  final String codigoDepartamento;
  final String nombreDepartamento;

  Departamento(
    {required this.codigoDepartamento, required this.nombreDepartamento});

  factory Departamento.fromJson(Map<String, dynamic> json) {
    return Departamento(
      codigoDepartamento: json['codigo_departamento'],
      nombreDepartamento: json['nombre_departamento'],
    );
  }
 }