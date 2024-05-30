import 'dart:math';

import 'package:flutter/material.dart';

class Cilindro extends StatefulWidget {
  const Cilindro({super.key});

  @override
  State<Cilindro> createState() => _CilindroState();
}

class _CilindroState extends State<Cilindro> {
  TextEditingController radioController = TextEditingController();
  TextEditingController alturaController = TextEditingController();
  String resultado = ' ';

  void calcularVolumen() {
    double radio = double.parse(radioController.text);
    double altura = double.parse(alturaController.text);
    
    double volumen =  pi * pow(radio,2) * altura;

    resultado = volumen.toStringAsFixed(2);

    setState(() {});
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cilindro'),
        leading: const Icon(Icons.rectangle_outlined),
      ),
      body: Center(
        child: SizedBox(
          width: 300,
          height: 400,
          child: Column(
            children: [
              TextField(
                controller: radioController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    labelText: 'Radio',
                    labelStyle: TextStyle(
                        fontWeight: FontWeight.w100,
                        color: Color.fromARGB(255, 2, 183, 98))),
                style:
                    const TextStyle(color: Colors.black87), // Color del texto
              ),

              TextField(
                controller: alturaController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    labelText: 'Altura',
                    labelStyle: TextStyle(
                        fontWeight: FontWeight.w100,
                        color: Color.fromARGB(255, 2, 183, 98))),
              ),
              ElevatedButton(
                  onPressed: () {
                    calcularVolumen();
                  },
                  child: const Text('Calcular volumen')),
              const SizedBox(height: 10),
             
              Text('El volumen es: $resultado')
            ],
          ),
        ),
      ),
    );
  }
}