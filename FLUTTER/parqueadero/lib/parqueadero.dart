// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

class parqueadero extends StatefulWidget {
  const parqueadero({super.key});

  @override
  State<parqueadero> createState() => _parqueaderoState();
}

class _parqueaderoState extends State<parqueadero> {
  final TextEditingController cedulaController = TextEditingController();
  final TextEditingController placaController = TextEditingController();

  List<parqueaderoVehiculos> vehiculos = [];
  String resultado = " ";

  void accesoVehiculos(List<parqueaderoVehiculos> vehiculos) {
    String cedula = cedulaController.text;
    String placa = placaController.text;

    for (var v in vehiculos) {
      if (v.cedula == cedula && v.placa == placa) {
        resultado = "Ya se encuentra registrado este vehículo ";
        break;
      } else if (vehiculos.length >= 20) {
        resultado = "El parqueadero está lleno";
        break;
      } else {
        parqueaderoVehiculos vehiculo = parqueaderoVehiculos(cedula, placa);
        vehiculos.add(vehiculo);
        resultado = "Vehículo guardado con éxito";
        break;
      }
    }
    setState(() {});
  }

  void retiroVehiculo(List<parqueaderoVehiculos> vehiculos) {
    for (int i = 0; i < vehiculos.length; i++) {
      if (vehiculos[i].cedula == cedulaController.text &&
          vehiculos[i].placa == placaController.text) {
        vehiculos.removeAt(i);
        resultado = "Vehículo retirado con éxito";
        break;
      } else {
        resultado = "No se encontró el vehículo";
      }
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Parqueadero'),
        leading: const Icon(Icons.rectangle_outlined),
      ),
      body: Center(
        child: SizedBox(
          width: 300,
          height: 400,
          child: Form(
            child: Column(
              children: [
                TextFormField(
                  controller: cedulaController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      labelText: 'Ingrese su cédula',
                      labelStyle: TextStyle(
                          fontWeight: FontWeight.w100,
                          color: Color.fromARGB(255, 2, 183, 98))),
                  maxLength: 10,
                  style: const TextStyle(color: Colors.black87),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingrese su cédula';
                    }
                    if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                      return 'La cédula solo puede contener números';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: placaController,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                      labelText: 'Ingrese la placa',
                      labelStyle: TextStyle(
                          fontWeight: FontWeight.w100,
                          color: Color.fromARGB(255, 2, 183, 98))),
                  maxLength: 7,
                  style: const TextStyle(color: Colors.black87),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingrese la placa';
                    }
                    if (!RegExp(r'^[a-zA-Z0-9]+$').hasMatch(value)) {
                      return 'La placa solo puede contener números y letras';
                    }
                    return null;
                  },
                ),
                ElevatedButton(
                    onPressed: () {
                      accesoVehiculos(vehiculos);
                    },
                    child: const Text('Ingresar vehículo')),
                const SizedBox(height: 10),
                ElevatedButton(
                    onPressed: () {
                      retiroVehiculo(vehiculos);
                    },
                    child: const Text('Retirar vehículo')),
                const SizedBox(height: 10),
                ElevatedButton(
                    onPressed: () {
                      resultado = vehiculos.toString();
                    },
                    child: const Text('Lista de vehículos')),
                const SizedBox(height: 10),
                Text(resultado)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class parqueaderoVehiculos {
  String? placa;
  String? cedula;

  parqueaderoVehiculos(this.cedula, this.placa);

  @override
  String toString() {
    return 'PLACA: $placa\n CÉDULA: $cedula \n------------------------------------------------';
  }
}
