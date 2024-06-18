import 'package:flutter/material.dart';
import '../../controllers/ProveedorController.dart';
import '../../models/Proveedor.dart';
import 'DetallesProveedor.dart';
import 'forms/RegistrarProveedor.dart';
import '../../widgets/CardProveedores.dart';

class Proveedores extends StatefulWidget {
  const Proveedores({super.key});

  @override
  State<Proveedores> createState() => _ProveedoresState();
}

class _ProveedoresState extends State<Proveedores> {
  late Future<List<Proveedor>> _futureProveedores;

  @override
  void initState() {
    super.initState();
    _futureProveedores = fetchProveedores();
  }

  void _refreshProveedores() {
    setState(() {
      _futureProveedores = fetchProveedores();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 42, 54, 68),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 42, 54, 68),
        title: const Text(
          'Proveedores',
          style: TextStyle(
            color: Color.fromRGBO(255, 213, 79, 1),
          ),
        ),
      ),
      body: FutureBuilder<List<Proveedor>>(
        future: _futureProveedores,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('Proveedores no encontrados'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                var proveedor = snapshot.data![index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            DetallesProveedor(id: proveedor.id),
                      ),
                    ).then((_) {
                      _refreshProveedores();
                    });
                  },

                  child: Container(
                    padding: const EdgeInsets.all(10.0),
                    child: CardWidget(
                      colorIcon: const Color.fromARGB(255, 252, 232, 54),
                      proveedor: proveedor.nombreProveedor,
                    ),
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
              MaterialPageRoute(builder: (context) => const Registrar());
          await Navigator.push(context, route);
          _refreshProveedores();
        },
        backgroundColor: Colors.yellow,
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
