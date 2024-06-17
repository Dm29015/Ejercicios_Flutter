import 'package:comerciplus_flutter/pages/Clients/ListarClientes.dart';
import 'package:comerciplus_flutter/pages/Clients/forms/EditarCliente.dart';
import 'package:flutter/material.dart';
import '../../controllers/ClienteController.dart';
import '../../models/Cliente.dart';
import '../../widgets/CardInfo.dart';

class DetallesCliente extends StatefulWidget {
  final int id;

  const DetallesCliente({super.key, required this.id});

  @override
  State<DetallesCliente> createState() => _DetallesClienteState();
}

class _DetallesClienteState extends State<DetallesCliente> {
  late Cliente cliente;
  late Future<Cliente> _futureCliente;

  @override
  void initState() {
    super.initState();
    _refreshCliente();
  }

  void _refreshCliente() {
    setState(() {
      _futureCliente = fetchCliente(widget.id);
    });
  }

  Future<void> _eliminarCliente(BuildContext context, int id) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirmar Eliminación'),
          content:
              const Text('¿Estás seguro de que deseas eliminar este Cliente?'),
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
                  await deleteCliente(id);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('¡Cliente eliminado con éxito!'),
                      duration: Duration(seconds: 2),
                      backgroundColor: Colors.green,
                    ),
                  );
                  Navigator.of(context).pop();
                  final route = MaterialPageRoute(
                      builder: (context) => const Clientes());
                  await Navigator.push(context, route);
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Error al eliminar el Cliente.'),
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
                  builder: (context) => EditarCliente(id: widget.id));
              await Navigator.push(context, route);
              _refreshCliente();
            },
          ),
          IconButton(
            icon: const Icon(Icons.delete, color: Colors.red),
            onPressed: () {
              _eliminarCliente(context, widget.id);
              Navigator.of(context);
            },
          ),
        ],
      ),
      body: Builder(
        builder: (context) {
          return FutureBuilder<Cliente>(
            future: _futureCliente,
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
                    'Cliente no encontrado',
                    style: TextStyle(color: Colors.white),
                  ),
                );
              } else {
                var cliente = snapshot.data!;
                return ListView(
                  padding: const EdgeInsets.all(15.0),
                  children: [
                    CardW(
                        nombre:
                            '${cliente.nombreCliente} ${cliente.apellidoCliente}'),
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
                              'Información personal',
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
                                dato: cliente.cedulaCliente,
                                icono: Icons.assignment_ind_outlined,
                                colorIcono:
                                    const Color.fromARGB(188, 255, 7, 201),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 15.0),
                              child: CardInfo(
                                dato: cliente.telefonoCliente,
                                icono: Icons.phone_android_rounded,
                                colorIcono: Colors.green,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 15.0),
                              child: CardInfo(
                                dato: cliente.direccionCliente,
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
