import 'package:comerciplus_flutter/pages/Proveedores/DetallesProveedor.dart';
import 'package:comerciplus_flutter/pages/Proveedores/forms/RegistrarProveedor.dart';
import 'package:comerciplus_flutter/widgets/Card.dart';
import '../../controllers/ProveedorController.dart';
import 'package:flutter/material.dart';
import '../../models/Proveedor.dart';

class Proveedores extends StatefulWidget {
  const Proveedores({super.key});

  @override
  State<Proveedores> createState() => _ProveedoresState();
}

class _ProveedoresState extends State<Proveedores> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 42, 54, 68),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 42, 54, 68),
        title: const Text('Proveedores', style: TextStyle(color:Color.fromRGBO(255, 213, 79, 1),),),
      ),
      body: FutureBuilder<List<Proveedor>>(
        future: fetchProveedores(),
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
                         builder: (context) => Detallesproveedor(id: proveedor.id),
                      ),
                    );
                  },
                child: Container(
                  padding: const EdgeInsets.all(10.0),
                  child: CardWidget(
                        colorIcon: const Color.fromARGB(255, 252, 232, 54),
                        proveedor: proveedor.nombreProveedor,
                      ),
                )
                );
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final route =
              MaterialPageRoute(builder: (context) => const Registrar());
          Navigator.push(context, route);
        },
        backgroundColor: Colors.yellow,
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
