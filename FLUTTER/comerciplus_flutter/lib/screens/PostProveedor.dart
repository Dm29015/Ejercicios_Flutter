import 'package:flutter/material.dart';

import '../models/Registrar.dart';

class Registrar extends StatefulWidget {
  const Registrar({super.key});

  @override
  State<Registrar> createState() => _RegistrarState();
}

TextEditingController nit = TextEditingController();
TextEditingController nombreProveedor = TextEditingController();
TextEditingController telefonoProveedor = TextEditingController();
TextEditingController direccionProveedor = TextEditingController();
TextEditingController nombreVendedor = TextEditingController();

class _RegistrarState extends State<Registrar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registrar proveedor'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          TextField(
            controller: nit,
            decoration: const InputDecoration(hintText: "NIT"),
          ),
          const SizedBox(
            height: 20,
          ),
          TextField(
            controller: nombreProveedor,
            decoration: const InputDecoration(hintText: "Nombre de la empresa"),
          ),
          const SizedBox(
            height: 20,
          ),
          TextField(
            controller: telefonoProveedor,
            decoration:
                const InputDecoration(hintText: "Télefono de la empresa"),
          ),
          const SizedBox(
            height: 20,
          ),
          TextField(
            controller: direccionProveedor,
            decoration:
                const InputDecoration(hintText: "Dirección de la empresa"),
          ),
          const SizedBox(
            height: 20,
          ),
          TextField(
            controller: nombreVendedor,
            decoration: const InputDecoration(hintText: "Vendedor"),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton.icon(
              onPressed: () {
                var proveedor = {
                  "nit": nit.text,
                  "nombreEmpresa": nombreProveedor.text,
                  "direccionEmpresa": direccionProveedor.text,
                  "telefonoEmpresa": telefonoProveedor.text,
                  "nombreVendedor": nombreVendedor.text
                };

                print(proveedor);
                Http.postProveedor(proveedor);
              },
              icon: const Icon(Icons.new_label),
              label: const Text("Registrar"))
        ]),
      ),
    );
  }
}
