import 'package:comerciplus_flutter/controllers/ClienteController.dart';
import 'package:flutter/material.dart';

class EditarCliente extends StatefulWidget {
  final int id;
  const EditarCliente({super.key, required this.id});

  @override
  State<EditarCliente> createState() => _EditarClienteState();
}

class _EditarClienteState extends State<EditarCliente> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController cedulaCliente = TextEditingController();
  TextEditingController nombreCliente = TextEditingController();
  TextEditingController apellidoCliente = TextEditingController();
  TextEditingController direccionCliente = TextEditingController();
  TextEditingController telefonoCliente = TextEditingController();

  @override
  void initState() {
    super.initState();
    cargarDatosCliente();
  }

  void cargarDatosCliente() async {
    try {
      var cliente = await fetchCliente(widget.id);

      setState(() {
        cedulaCliente.text = cliente.cedulaCliente;
        nombreCliente.text = cliente.nombreCliente;
        apellidoCliente.text = cliente.apellidoCliente;
        direccionCliente.text = cliente.direccionCliente;
        telefonoCliente.text = cliente.telefonoCliente;
        
      });

    } catch (e) {
      throw Exception('Error al editar el cliente');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 42, 54, 68),
        iconTheme: const IconThemeData(color: Color.fromRGBO(255, 213, 79, 1)),
        title: const Text(
          'Editar cliente',
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
              TextFormField(
                controller: cedulaCliente,
                style:
                    const TextStyle(color: Color.fromARGB(234, 255, 255, 255)),
                decoration: const InputDecoration(
                  labelText: 'Número de identificación',
                  labelStyle:
                      TextStyle(color: Color.fromARGB(234, 255, 255, 255)),
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.assignment_ind_outlined,
                      color: Color.fromRGBO(255, 214, 79, 0.644)),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese su cédula';
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
                  labelText: 'Nombre',
                  labelStyle:
                      TextStyle(color: Color.fromARGB(234, 255, 255, 255)),
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person,
                      color: Color.fromRGBO(255, 214, 79, 0.644)),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese su nombre';
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
                  labelText: 'Apellidos',
                  labelStyle:
                      TextStyle(color: Color.fromARGB(234, 255, 255, 255)),
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person,
                      color: Color.fromRGBO(255, 214, 79, 0.644)),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese sus apellidos';
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
                  labelText: 'Teléfono',
                  labelStyle:
                      TextStyle(color: Color.fromARGB(234, 255, 255, 255)),
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.phone,
                      color: Color.fromRGBO(255, 214, 79, 0.644)),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese el teléfono';
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
                  labelText: 'Dirección',
                  labelStyle:
                      TextStyle(color: Color.fromARGB(234, 255, 255, 255)),
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.location_on,
                      color: Color.fromRGBO(255, 214, 79, 0.644)),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese la dirección';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    var clienteEdit = {
                      "id": widget.id,
                      "cedulaCliente": cedulaCliente.text,
                      "nombreCliente": nombreCliente.text,
                      "apellidoCliente": apellidoCliente.text,
                      "direccionCliente": direccionCliente.text,
                      "telefonoCliente": telefonoCliente.text,
                      "estadoCliente": true,
                    };

                    try {
                      await updateCliente(widget.id, clienteEdit);

                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Cliente editado con éxito!'),
                          duration: Duration(seconds: 2),
                          backgroundColor: Colors.green,
                        ),
                      );

                      Navigator.pop(context); 
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Error al editar el cliente.'),
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
                  'Editar',
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
