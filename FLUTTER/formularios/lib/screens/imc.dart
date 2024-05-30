import 'package:flutter/material.dart';

class IMC extends StatefulWidget {
  const IMC({super.key});

  @override
  State<IMC> createState() => _IMCState();
}

class _IMCState extends State<IMC> {
  TextEditingController pesoController = TextEditingController();
  TextEditingController alturaController = TextEditingController();

  String resultado = ' ';

void calcularIMC(){
double peso = double.parse(pesoController.text);
double altura = double.parse(alturaController.text);
double imc = peso / (altura * altura);

resultado = imc.toString();
setState(() {});
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('IMC'),
        leading: const Icon(Icons.rectangle_outlined),
      ),
      body: Center(
        child: SizedBox(
          width: 300,
          height: 400,
          child: Column(
            children: [
              TextField(
                controller: pesoController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    labelText: 'Ingrese su peso en kilogramos',
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
                    labelText: 'Ingrese su altura en metros',
                    labelStyle: TextStyle(
                        fontWeight: FontWeight.w100,
                        color: Color.fromARGB(255, 2, 183, 98))),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                  onPressed: () {
                    calcularIMC();
                  },
                  child: const Text('Calcular IMC')),
              const SizedBox(height: 10),
              Text('Su índice de IMC es: $resultado')
            ],
          ),
        ),
      ),
    );
  }
}
