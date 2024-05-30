// ignore_for_file: file_names, camel_case_types
import 'dart:math';
import 'package:flutter/material.dart';

class numeroAleatorio extends StatefulWidget {
  const numeroAleatorio({super.key});

  @override
  State<numeroAleatorio> createState() => _numeroAleatorioState();
}

String numeroRandom = '0';
String ciudad = "";
List<String> ciudades = ['Medellín', 'Risaralda', 'Santander'];

class _numeroAleatorioState extends State<numeroAleatorio> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text(
              "Lotería de Medellín",
              style: TextStyle(color: Colors.white70),
            ),
            backgroundColor: Colors.teal,
            leading: const Icon(Icons.ramen_dining,
                color: Color.fromARGB(223, 64, 195, 255))),
        body: Center(
          child: Text(
            'NÚMERO GANADOR: $numeroRandom \nLOTERÍA GANADORA: $ciudad',
            style: const TextStyle(fontSize: 17),
          ),
        ),
        floatingActionButton: Padding(
            padding: const EdgeInsets.all(50),
            child: Row(children: [
              FloatingActionButton.small(
                child: const Icon(Icons.add_card_sharp),
                onPressed: () {
                  int numero = Random().nextInt(1000);

                  numeroRandom = numero.toString().padLeft(3, '0');

                  Random random = Random();

                  int i = random.nextInt(ciudades.length);

                  ciudad = ciudades[i];

                  setState(() {});
                },
              )
            ])));
  }
}
