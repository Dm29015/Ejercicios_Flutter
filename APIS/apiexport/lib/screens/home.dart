import 'package:flutter/material.dart';
import '../Controller/ExportController.dart';
import '../Models/Export.dart';
import 'RegisterExport.dart';
import 'EditExport.dart';

class ExportListPage extends StatefulWidget {
  const ExportListPage({super.key});

  @override
  _ExportListPageState createState() => _ExportListPageState();
}

class _ExportListPageState extends State<ExportListPage> {
  late Future<List<Export>> _futureExports;

  @override
  void initState() {
    super.initState();
    _refreshExports();
  }

  void _refreshExports() {
    setState(() {
      _futureExports = fetchExports();
    });
  }

  Future<void> _deleteExport(BuildContext context, int id) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirmar Eliminación'),
          content: const Text('¿Estás seguro de que deseas eliminar esta exportación?'),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancelar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Eliminar'),
              onPressed: () async {
                try {
                  await deleteExport(id);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Exportación eliminada con éxito!'),
                      duration: Duration(seconds: 2),
                      backgroundColor: Colors.green,
                    ),
                  );
                  Navigator.pop(context);
                  _refreshExports();
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Error al eliminar la exportación.'),
                      duration: Duration(seconds: 2),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              },
            ),
          ],
        );
      },
    );
  }

  void _navigateToEditForm(Export export) async {
    final result = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return EditExport(export: export);
      },
    );

    if (result == true) {
      _refreshExports();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exportaciones'),
      ),
      body: FutureBuilder<List<Export>>(
        future: _futureExports,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No se encontraron exportaciones.'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final export = snapshot.data![index];
                return ListTile(
                  title: Text(export.nombreProducto,style: const TextStyle(fontWeight: FontWeight.bold),),
                  subtitle: Text(
                      'Fecha: ${export.fechaRegistro} \nPeso: ${export.kg} kilogramos \nDólar: \$${export.precioDollar}'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.edit),
                        onPressed: () => _navigateToEditForm(export),
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () => _deleteExport(context, export.id),
                      ),
                    ],
                  ),
                );
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final route =
              MaterialPageRoute(builder: (context) => const RegisterExport());
          await Navigator.push(context, route);
          _refreshExports();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
