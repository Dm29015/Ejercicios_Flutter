import 'package:comerciplus_flutter/pages/Clients/DetallesCliente.dart';
import 'package:comerciplus_flutter/pages/Clients/forms/RegistrarCliente.dart';
import 'package:flutter/material.dart';
import '../../controllers/ClienteController.dart';
import '../../models/Cliente.dart';
import '../../widgets/CardClientes.dart';

class Clientes extends StatefulWidget {
  const Clientes({super.key});

  @override
  State<Clientes> createState() => _ClientesState();
}

class _ClientesState extends State<Clientes> {
  late Future<List<Cliente>> _futureClientes;

  @override
  void initState() {
    super.initState();
    _refreshClientes();
  }

  void _refreshClientes() {
    setState(() {
      _futureClientes = fetchClientes();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 42, 54, 68),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 42, 54, 68),
        title: const Text(
          'Clientes',
          style: TextStyle(
            color: Color.fromRGBO(255, 213, 79, 1),
          ),
        ),
      ),
      body: FutureBuilder<List<Cliente>>(
        future: _futureClientes,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('Clientes no encontrados'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                var cliente = snapshot.data![index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetallesCliente(id: cliente.id),
                      ),
                    ).then((_) {
                      _refreshClientes();
                    });
                  },
                  child: Container(
                      padding: const EdgeInsets.all(10.0),
                      child: CardCliente(
                          colorIcon: const Color.fromARGB(255, 252, 232, 54),
                          nombreCliente: cliente.nombreCliente,
                          apellidoCliente: cliente.apellidoCliente,
                          telefonoCliente: cliente.telefonoCliente)),
                );
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final route =
              MaterialPageRoute(builder: (context) => const RegistrarCliente());
          await Navigator.push(context, route);
          _refreshClientes();
        },
        backgroundColor: Colors.yellow,
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
