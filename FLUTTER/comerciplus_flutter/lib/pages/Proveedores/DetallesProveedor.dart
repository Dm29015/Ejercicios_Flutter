
import 'package:comerciplus_flutter/pages/Proveedores/forms/EditarProveedor.dart';
import 'package:flutter/material.dart';
import '../../controllers/ProveedorController.dart';
import '../../models/Proveedor.dart';
import '../../widgets/CardInfo.dart';

class DetallesProveedor extends StatefulWidget {
  final int id;

  const DetallesProveedor({super.key, required this.id});

  @override
  State<DetallesProveedor> createState() => _DetallesProveedorState();
}

class _DetallesProveedorState extends State<DetallesProveedor> {
  late Proveedor proveedor;

  late Future<Proveedor> _proveedor;

  @override
  void initState() {
    super.initState();
    _refreshProveedor();
  }

  void _refreshProveedor() {
    setState(() {
      _proveedor = fetchProveedor(widget.id);
    });
  }

 Future<void> _eliminarProveedor(BuildContext context, int id) async {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Confirmar Eliminación'),
        content: const Text('¿Estás seguro de que deseas eliminar este proveedor?'),
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
                await deleteProveedor(id);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('¡Proveedor eliminado con éxito!'),
                    duration: Duration(seconds: 2),
                    backgroundColor: Colors.green,
                  ),
                );
                Navigator.pop(context);
                Navigator.pop(context);
              } catch (e) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Error al eliminar el proveedor.'),
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


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 42, 54, 68),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 42, 54, 68),
        iconTheme: const IconThemeData(color: Color.fromRGBO(255, 213, 79, 1)),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit, color: Colors.lightBlueAccent),
            onPressed: () async {
              final route = MaterialPageRoute(
                  builder: (context) => Editar(id: widget.id));
              await Navigator.push(context, route);
              _refreshProveedor();
            },
          ),
          IconButton(
            icon: const Icon(Icons.delete, color: Colors.red),
            onPressed: () {
              _eliminarProveedor(context, widget.id);
            },
          ),
        ],
      ),
      body: Builder(
        builder: (context) {
          return FutureBuilder<Proveedor>(
            future: _proveedor,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(
                  child: Text(
                    'Error: ${snapshot.error}',
                    style: const TextStyle(color: Colors.red),
                  ),
                );
              } else if (!snapshot.hasData) {
                return const Center(
                  child: Text(
                    'Proveedor no encontrado',
                    style: TextStyle(color: Colors.white),
                  ),
                );
              } else {
                var proveedor = snapshot.data!;
                return ListView(
                  padding: const EdgeInsets.all(15.0),
                  children: [
                    CardW(nombre: proveedor.nombreProveedor),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(width: 10),
                            const Text(
                              'Información sobre la empresa',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Divider(color: Colors.white),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 15.0),
                              child: CardInfo(
                                dato: proveedor.nit,
                                icono: Icons.assignment_ind_outlined,
                                colorIcono:
                                    const Color.fromARGB(188, 255, 7, 201),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 15.0),
                              child: CardInfo(
                                dato: proveedor.nombreVendedor,
                                icono: Icons.email_outlined,
                                colorIcono: Colors.blue,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 15.0),
                              child: CardInfo(
                                dato: proveedor.telefonoProveedor,
                                icono: Icons.phone_android_rounded,
                                colorIcono: Colors.green,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 15.0),
                              child: CardInfo(
                                dato: proveedor.direccionProveedor,
                                icono: Icons.location_on_outlined,
                                colorIcono: Colors.pink,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                );
              }
            },
          );
        },
      ),
    );
  }
}
