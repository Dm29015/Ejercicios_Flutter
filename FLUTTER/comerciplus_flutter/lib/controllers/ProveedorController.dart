import 'package:http/http.dart' as http;
import '../models/Proveedor.dart';
import 'dart:convert';

  const String API = "http://localhost:5167/api/proveedores";

// GET: Listar Proveedores
  Future<List<Proveedor>> fetchProveedores() async {
    final response = await http.get(Uri.parse(API));
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse
          .map((proveedor) => Proveedor.fromJson(proveedor))
          .toList();
    } else {
      throw Exception('Falló en la carga de la API');
    }
  }

// GET: Listar Proveedor
  Future<Proveedor> fetchProveedor(int id) async {
  final response = await http.get(Uri.parse('$API/$id'));
  if (response.statusCode == 200) {
    return Proveedor.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Falló en la carga de la API');
  }
}

// POST: Crear proveedor
  Future<Proveedor> createProveedor(Map proveedor) async {
    final response = await http.post(
      Uri.parse(API),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: json.encode(proveedor),
    );

    if (response.statusCode == 200) {//Si la respuesta es 200 la inserción es exitosa
      var data = jsonDecode(response.body.toString());
      print(data);
      return data;
    } else {
      print(response.statusCode);
      throw Exception('Error al crear proveedor');
    }
  }

// DELETE : Eliminar
  Future<void> deleteProveedor(int id) async {
    final response = await http.delete(
      Uri.parse('$API/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode != 200) {
      throw Exception('Error al eliminar proveedor');
    }
  }

