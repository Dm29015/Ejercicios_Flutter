import 'package:http/http.dart' as http;
import '../Models/Export.dart';
import 'dart:convert';


  // ignore: constant_identifier_names
  const String API = "http://localhost:5203/api/Export";

// GET: Listar exportes
Future<List<Export>> fetchExports() async {
    final response = await http.get(Uri.parse(API));
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((export) => Export.fromJson(export)).toList();
    } else {
      throw Exception('Falló en la carga de la API');
    }
  }

// GET: Listar export
  Future<Export> fetchExport(int id) async {
    final response = await http.get(Uri.parse('$API/$id'));
    if (response.statusCode == 200) {
      return Export.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Falló en la carga de la API');
    }
  }

// POST: Crear Export
  Future<void> createExport(Map export) async {
    final response = await http.post(
      Uri.parse(API),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: json.encode(export),
    );

    if (response.statusCode == 200) {
      //Si la respuesta es 200 la inserción es exitosa
      var data = jsonDecode(response.body.toString());
      print(data);
      return data;
    } else {
      print(response.statusCode);
      throw Exception('Error al crear export');
    }
  }

  Future<Export> updateExport(String id, Export export) async {
    final response = await http.put(
      Uri.parse('$API/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: json.encode(export),
    );
    if (response.statusCode == 200) {
      return Export.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to update export');
    }
  }

// DELETE : Eliminar

  Future<void> deleteExport(String id) async {
    final response = await http.delete(
      Uri.parse('$API/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to delete export');
    }
  }

