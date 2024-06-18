import 'package:delitos_api/delitoModel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

  const String api = "https://www.datos.gov.co/resource/9vha-vh9n.json";

// GET: Listar delitos
Future<List<Delito>> fetchDelito() async {
  try {
    final response = await http.get(Uri.parse(api));
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((delito) => Delito.fromJson(delito)).toList();
    } else {
      print('Error en la solicitud HTTP: ${response.statusCode}');
      throw Exception('Falló en la carga de la API');
    }
  } catch (e) {
    print('Error en la carga de la API: $e');
    throw Exception('Error inesperado al cargar los delitos');
  }
}
