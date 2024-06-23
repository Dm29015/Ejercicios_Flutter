import 'package:flutter/material.dart';
import '../Controller/ExportController.dart';
import '../Models/Export.dart';

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

  Future<void> _deleteExport(String id) async {
    await deleteExport(id);
    _refreshExports();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exports'),
      ),
      body: FutureBuilder<List<Export>>(
        future: _futureExports,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No exports found.'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final export = snapshot.data![index];
                return ListTile(
                  title: Text(export.nombreProducto),
                  subtitle: Text(
                      'Kg: ${export.kg}, Precio: \$${export.precioDollar}'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.edit),
                        onPressed: () => {},
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () => _deleteExport(export.id),
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
        onPressed: () => {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
