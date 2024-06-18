import 'package:http/http.dart' as http;
import '../models/Proveedor.dart';
import 'dart:convert';

  const String API = "http://deisy77-001-site1.gtempurl.com/api/proveedores";

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
  Future<void> createProveedor(Map proveedor) async {
    final response = await http.post(
      Uri.parse(API),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: json.encode(proveedor),
    );

    if (response.statusCode != 200 && response.statusCode != 201) {
      throw Exception('Error al crear proveedor');
    }
  }

  // PUT: Actualizar proveedor
Future<void> updateProveedor(int id, Map proveedor) async {
  final response = await http.put(
    Uri.parse('$API/$id'),
    headers: {
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: json.encode(proveedor),
  );

   if (response.statusCode != 200 && response.statusCode != 204) {
    (response.statusCode);
    throw Exception('Error al actualizar proveedor');
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

  if (response.statusCode != 200 && response.statusCode != 204) {
    (response.statusCode);
      throw Exception('Error al eliminar proveedor');
    }
}




