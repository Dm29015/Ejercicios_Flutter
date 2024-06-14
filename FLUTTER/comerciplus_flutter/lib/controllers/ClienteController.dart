import 'package:http/http.dart' as http;
import '../models/Cliente.dart';
import 'dart:convert';

  const String API = "http://deisy77-001-site1.gtempurl.com/api/clientes";

// GET: Listar Clientes
  Future<List<Cliente>> fetchClientes() async {
    final response = await http.get(Uri.parse(API));
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse
          .map((cliente) => Cliente.fromJson(cliente))
          .toList();
    } else {
      throw Exception('Falló en la carga de la API');
    }
  }

// GET: Listar Cliente
  Future<Cliente> fetchCliente(int id) async {
  final response = await http.get(Uri.parse('$API/$id'));
  if (response.statusCode == 200) {
    return Cliente.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Falló en la carga de la API');
  }
}

// POST: Crear Cliente
  Future<void> createCliente(Map Cliente) async {
    final response = await http.post(
      Uri.parse(API),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: json.encode(Cliente),
    );

    if (response.statusCode != 200 && response.statusCode != 201) {
      throw Exception('Error al crear Cliente');
    }
  }

  // PUT: Actualizar Cliente
Future<void> updateCliente(int id, Map Cliente) async {
  final response = await http.put(
    Uri.parse('$API/$id'),
    headers: {
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: json.encode(Cliente),
  );

  if (response.statusCode != 200 && response.statusCode != 201) {
    throw Exception('Error al actualizar Cliente');
  }
}


// DELETE : Eliminar cliente
  Future<void> deleteCliente(int id) async {
  final response = await http.delete(
    Uri.parse('$API/$id'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );

  if (response.statusCode != 200 && response.statusCode != 204) {
      throw Exception('Error al eliminar Cliente');
    }
}




