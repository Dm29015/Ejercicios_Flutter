import 'package:comerciplus_flutter/controllers/ClienteController.dart';
import 'package:flutter/material.dart';

class RegistrarCliente extends StatefulWidget {
  const RegistrarCliente({super.key});

  @override
  State<RegistrarCliente> createState() => _RegistrarClienteState();
}

class _RegistrarClienteState extends State<RegistrarCliente> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController cedulaCliente = TextEditingController();
  TextEditingController nombreCliente = TextEditingController();
  TextEditingController apellidoCliente = TextEditingController();
  TextEditingController direccionCliente = TextEditingController();
  TextEditingController telefonoCliente = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 42, 54, 68),
        iconTheme: const IconThemeData(color: Color.fromRGBO(255, 213, 79, 1)),
        title: const Text(
          'Registrar cliente',
          style: TextStyle(color: Color.fromRGBO(255, 213, 79, 1)),
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 42, 54, 68),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 20),
              TextFormField(
                controller: cedulaCliente,
                style:
                    const TextStyle(color: Color.fromARGB(234, 255, 255, 255)),
                decoration: const InputDecoration(
                  labelText: 'Cedula Cliente',
                  labelStyle:
                      TextStyle(color: Color.fromARGB(234, 255, 255, 255)),
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese la cédula del cliente';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: nombreCliente,
                style:
                    const TextStyle(color: Color.fromARGB(234, 255, 255, 255)),
                decoration: const InputDecoration(
                  labelText: 'Nombre Cliente',
                  labelStyle:
                      TextStyle(color: Color.fromARGB(234, 255, 255, 255)),
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese el nombre del cliente';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: apellidoCliente,
                style:
                    const TextStyle(color: Color.fromARGB(234, 255, 255, 255)),
                decoration: const InputDecoration(
                  labelText: 'Apellido Cliente',
                  labelStyle:
                      TextStyle(color: Color.fromARGB(234, 255, 255, 255)),
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese el apellido del cliente';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: direccionCliente,
                style:
                    const TextStyle(color: Color.fromARGB(234, 255, 255, 255)),
                decoration: const InputDecoration(
                  labelText: 'Dirección Cliente',
                  labelStyle:
                      TextStyle(color: Color.fromARGB(234, 255, 255, 255)),
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese la dirección del cliente';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: telefonoCliente,
                style:
                    const TextStyle(color: Color.fromARGB(234, 255, 255, 255)),
                decoration: const InputDecoration(
                  labelText: 'Teléfono Cliente',
                  labelStyle:
                      TextStyle(color: Color.fromARGB(234, 255, 255, 255)),
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese el teléfono del cliente';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    var cliente = {
                      "cedulaCliente": cedulaCliente.text,
                      "nombreCliente": nombreCliente.text,
                      "apellidoCliente": apellidoCliente.text,
                      "direccionCliente": direccionCliente.text,
                      "telefonoCliente": telefonoCliente.text,
                      "estadoCliente": true,
                    };

                    try {
                      await createCliente(cliente);

                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('¡Cliente agregado con éxito!'),
                          duration: Duration(seconds: 2),
                          backgroundColor: Colors.green,
                        ),
                      );

                      Navigator.pop(context);
                    } catch (e) {

                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Error al agregar el cliente.'),
                          duration: Duration(seconds: 2),
                          backgroundColor: Colors.red,
                        ),
                      );
                    }
                  }
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(255, 213, 79, 1)),
                child: const Text(
                  'Registrar',
                  style: TextStyle(color: Color.fromARGB(255, 42, 54, 68)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
