import 'package:flutter/material.dart';
import '../../../controllers/ProveedorController.dart';

class Registrar extends StatefulWidget {
  const Registrar({super.key});

  @override
  State<Registrar> createState() => _RegistrarState();
}

class _RegistrarState extends State<Registrar> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController nit = TextEditingController();
  TextEditingController nombreProveedor = TextEditingController();
  TextEditingController telefonoProveedor = TextEditingController();
  TextEditingController direccionProveedor = TextEditingController();
  TextEditingController nombreVendedor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 42, 54, 68),
        iconTheme: const IconThemeData(color: Color.fromRGBO(255, 213, 79, 1)),
        title: const Text(
          'Registrar proveedor',
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
                controller: nit,
                style:
                    const TextStyle(color: Color.fromARGB(234, 255, 255, 255)),
                decoration: const InputDecoration(
                  labelText: 'NIT',
                  labelStyle:
                      TextStyle(color: Color.fromARGB(234, 255, 255, 255)),
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.credit_card,
                      color: Color.fromRGBO(255, 214, 79, 0.644)),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese el NIT';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: nombreProveedor,
                style:
                    const TextStyle(color: Color.fromARGB(234, 255, 255, 255)),
                decoration: const InputDecoration(
                  labelText: 'Nombre de la empresa',
                  labelStyle:
                      TextStyle(color: Color.fromARGB(234, 255, 255, 255)),
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.business,
                      color: Color.fromRGBO(255, 214, 79, 0.644)),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese el nombre de la empresa';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: telefonoProveedor,
                style:
                    const TextStyle(color: Color.fromARGB(234, 255, 255, 255)),
                decoration: const InputDecoration(
                  labelText: 'Teléfono de la empresa',
                  labelStyle:
                      TextStyle(color: Color.fromARGB(234, 255, 255, 255)),
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.phone,
                      color: Color.fromRGBO(255, 214, 79, 0.644)),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese el teléfono de la empresa';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: direccionProveedor,
                style:
                    const TextStyle(color: Color.fromARGB(234, 255, 255, 255)),
                decoration: const InputDecoration(
                  labelText: 'Dirección de la empresa',
                  labelStyle:
                      TextStyle(color: Color.fromARGB(234, 255, 255, 255)),
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.location_on,
                      color: Color.fromRGBO(255, 214, 79, 0.644)),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese la dirección de la empresa';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: nombreVendedor,
                style:
                    const TextStyle(color: Color.fromARGB(234, 255, 255, 255)),
                decoration: const InputDecoration(
                  labelText: 'Nombre del vendedor',
                  labelStyle:
                      TextStyle(color: Color.fromARGB(234, 255, 255, 255)),
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person,
                      color: Color.fromRGBO(255, 214, 79, 0.644)),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese el nombre del vendedor';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    var proveedor = {
                      "nit": nit.text,
                      "nombreEmpresa": nombreProveedor.text,
                      "direccionEmpresa": direccionProveedor.text,
                      "telefonoEmpresa": telefonoProveedor.text,
                      "nombreVendedor": nombreVendedor.text
                    };

                    try {
                      await createProveedor(proveedor);

                      // Mostrar la alerta de éxito
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('¡Proveedor agregado con éxito!'),
                          duration: Duration(seconds: 2),
                          backgroundColor: Colors.green,
                        ),
                      );

                      // Volver a la página de listar proveedores y refrescar la lista
                      Navigator.pop(context);
                    } catch (e) {
                      // Mostrar la alerta de error
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Error al agregar el proveedor.'),
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
