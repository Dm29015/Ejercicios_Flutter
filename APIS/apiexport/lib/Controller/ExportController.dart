import 'package:http/http.dart' as http;
import '../Models/Export.dart';
import 'dart:convert';

const String api = "http://localhost:5203/api/Export";
const String apiDolar = "https://www.datos.gov.co/resource/mcec-87by.json";

// GET: Listar exportaciones
Future<List<Export>> fetchExports() async {
  final response = await http.get(Uri.parse(api));
  if (response.statusCode == 200) {
    List jsonResponse = json.decode(response.body);
    return jsonResponse.map((export) => Export.fromJson(export)).toList();
  } else {
    throw Exception('Falló en la carga de la api');
  }
}

// GET: Listar exportación
Future<Export> fetchExport(int id) async {
  final response = await http.get(Uri.parse('$api/$id'));
  if (response.statusCode == 200) {
    return Export.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Falló en la carga de la api');
  }
}

// POST: Crear exportación
Future<void> createExport(Map export) async {
  (export);
  final response = await http.post(
    Uri.parse(api),
    headers: {
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: json.encode(export),
  );

  if (response.statusCode == 200 || response.statusCode == 201) {
    //Si la respuesta es 200 la inserción es exitosa
    var data = jsonDecode(response.body.toString());
    (data);
    return data;
  } else {
    // (response.statusCode);
    (export);
    throw Exception('Error al crear export');
  }
}

Future<void> updateExport(int id, Map export) async {
  final response = await http.put(
    Uri.parse('$api/$id'),  // Reemplaza con tu URL de API real
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: json.encode(export),
  );
  if (response.statusCode != 200 && response.statusCode != 204) {
    throw Exception('Error al actualizar la exportación');
  }
}

// DELETE : Eliminar exportación
Future<void> deleteExport(int id) async {
  final response = await http.delete(
    Uri.parse('$api/$id'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );
  if (response.statusCode != 200 && response.statusCode != 204 ) {
    throw Exception('Error al eliminar la exportación');
  }
}

// GET: Traer valor del dólar
Future<double> valorDolar() async {
  final response = await http.get(Uri.parse(apiDolar));

  if (response.statusCode == 200) {
    List<dynamic> data = jsonDecode(response.body);

    if (data.isNotEmpty) {
      var valorDolar = double.parse(data[0]['valor']);
      return valorDolar;
    } else {
      throw Exception('No hay datos disponibles.');
    }
  } else {
    throw Exception('Error al cargar los datos');
  }
}