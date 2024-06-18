import 'package:flutter/material.dart';
import 'package:delitos_api/delitoModel.dart';
import 'delitoController.dart';

class Delitos extends StatefulWidget {
  const Delitos({super.key});

  @override
  State<Delitos> createState() => _DelitosState();
}

class _DelitosState extends State<Delitos> {
  late Future<List<Delito>> futureDelitos;
  TextEditingController searchController = TextEditingController();
  List<Delito> delitos = []; // Lista de delitos original obtenida de la API
  List<Delito> filteredDelitos =
      []; // Lista de delitos filtrada según la búsqueda

  @override
  void initState() {
    super.initState();
    futureDelitos = fetchDelito().then((delitosList) {
      delitos = delitosList;
      filteredDelitos = List.from(delitos); // Inicializa filteredDelitos con todos los delitos
      return delitosList;
    });
  }

  void filterDelitos(String searchText) {
    if (searchText.isEmpty) {
      filteredDelitos = List.from(delitos);
    } else {
      filteredDelitos = delitos.where((delito) {
        // Aquí define la lógica de búsqueda según los campos que desees considerar
        return delito.departamento
                .toUpperCase()
                .contains(searchText.toUpperCase()) ||
            delito.municipio.toUpperCase().contains(searchText.toUpperCase()) ||
            delito.tipohurto.toUpperCase().contains(searchText.toUpperCase());
      }).toList();
    }
    setState(() {}); // Actualiza la UI con los resultados filtrados
  }

  void showDelitoDetailModal(Delito delito) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Detalles del Delito'),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                InfoRow(campo: 'Departamento', valor: delito.departamento),
                InfoRow(campo: 'Municipio', valor: delito.municipio),
                InfoRow(campo: 'Código Dane', valor: delito.codigoDane),
                InfoRow(campo: 'Armas o Medios', valor: delito.armadiosMedios),
                InfoRow(campo: 'Fecha', valor: delito.fecha),
                InfoRow(campo: 'Género', valor: delito.genero),
                InfoRow(campo: 'Grupo Etario', valor: delito.grupoEtario),
                InfoRow(campo: 'Tipo de Hurto', valor: delito.tipohurto),
                InfoRow(campo: 'Cantidad', valor: delito.cantidad.toString()),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cerrar'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Delitos'),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: searchController,
              onChanged: (value) {
                filterDelitos(value);
              },
              decoration: InputDecoration(
                labelText: 'Buscar delito por cualquier campo',
                suffixIcon: IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    searchController.clear();
                    filterDelitos('');
                  },
                ),
              ),
            ),
          ),
          Expanded(
            child: FutureBuilder<List<Delito>>(
              future: futureDelitos,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  if (filteredDelitos.isEmpty &&
                      searchController.text.isNotEmpty) {
                    return Center(
                      child: Text(
                          'No se encontraron resultados para "${searchController.text}"'),
                    );
                  } else {
                    return ListView.builder(
                      itemCount: filteredDelitos.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            showDelitoDetailModal(filteredDelitos[index]);
                          },
                          child: ListTile(
                            title: Text(filteredDelitos[index].tipohurto),
                            subtitle: Text(filteredDelitos[index].municipio),
                          ),
                        );
                      },
                    );
                  }
                } else if (snapshot.hasError) {
                  return const Center(
                    child: Text('Error al cargar los delitos'),
                  );
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class InfoRow extends StatelessWidget {
  final String campo;
  final String valor;

  const InfoRow({super.key, required this.campo, required this.valor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              '$campo:',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(valor),
          ),
        ],
      ),
    );
  }
}
