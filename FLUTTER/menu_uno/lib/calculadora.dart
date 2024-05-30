// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

class Calculadora extends StatefulWidget {
  const Calculadora({super.key});

  @override
  State<Calculadora> createState() => _CalculadoraState();
}

class _CalculadoraState extends State<Calculadora> {
  TextEditingController n1Controller = TextEditingController();
  TextEditingController n2Controller = TextEditingController();
  String resultado = ' ';

  void Suma() {
    try {
      double numero1 = double.parse(n1Controller.text);
      double numero2 = double.parse(n2Controller.text);
      double suma = numero1 + numero2;
      resultado = suma.toString();
      setState(() {});
    } catch (e) {
      e.toString();
    }
  }

  void Resta() {
    try {
      double numero1 = double.parse(n1Controller.text);
      double numero2 = double.parse(n2Controller.text);
      double resta = numero1 - numero2;
      resultado = resta.toString();
      setState(() {});
    } catch (e) {
      e.toString();
    }
  }

  void Multiplicacion() {
    try {
      double numero1 = double.parse(n1Controller.text);
      double numero2 = double.parse(n2Controller.text);
      double multiplicacion = numero1 * numero2;
      resultado = multiplicacion.toString();
      setState(() {});
    } catch (e) {
      e.toString();
    }
  }

  void Division() {
    try {
      double numero1 = double.parse(n1Controller.text);
      double numero2 = double.parse(n2Controller.text);
      if(numero1 >= 0 && numero2 > 0){
        double division = numero1 / numero2;
      resultado = division.toString();
      setState(() {});
      }else{
        resultado = 'No se puede dividir por cero ni números negativos';
      }
    } catch (e) {
      e.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora'),
        backgroundColor: const Color.fromARGB(255, 7, 113, 170),
        leading: const Icon(Icons.calculate_outlined),
      ),
      body: Center(
        child: SizedBox(
          width: 300,
          height: 400,
          child: Column(
            children: [
              TextField(
                controller: n1Controller,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    labelText: 'Primer número',
                    labelStyle: TextStyle(
                        fontWeight: FontWeight.w100,
                        color: Color.fromARGB(255, 13, 87, 126))),
                style:
                    const TextStyle(color: Colors.black87), // Color del texto
              ),
              TextField(
                controller: n2Controller,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    labelText: 'Segundo número',
                    labelStyle: TextStyle(
                        fontWeight: FontWeight.w100,
                        color: Color.fromARGB(255, 13, 87, 126))),
              ),
              
              const SizedBox(height: 10),
              Wrap(
                spacing: 25,
                runSpacing: 20,
                alignment: WrapAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Suma();
                    },
                    child: const Text('Sumar'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Resta();
                    },
                    child: const Text('Restar'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Multiplicacion();
                    },
                    child: const Text('Multiplicar'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Division();
                    },
                    child: const Text('Dividir'),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Text('Resultado: $resultado')
            ],
          ),
        ),
      ),
    );
  }
}
