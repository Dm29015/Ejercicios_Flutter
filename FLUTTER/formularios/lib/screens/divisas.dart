import 'package:flutter/material.dart';

class Divisas extends StatefulWidget {
  const Divisas({super.key});

  @override
  State<Divisas> createState() => _DivisasState();
}

class _DivisasState extends State<Divisas> {
  TextEditingController valorController = TextEditingController();
  String text = '';
  String resultado = ' ';

void cop_dolar(){
  double valor = double.parse(valorController.text);
  double divisa = valor * 0.00026;
  resultado = divisa.toString();
  setState(() {});
}

void dolar_cop(){
  double valor = double.parse(valorController.text);
  double divisa = valor * 3853;
  resultado =  divisa.toStringAsFixed(2);
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
                controller: valorController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    labelText: 'Valor',
                    labelStyle: TextStyle(
                        fontWeight: FontWeight.w100,
                        color: Color.fromARGB(255, 2, 183, 98))),
                style:
                    const TextStyle(color: Colors.black87), // Color del texto
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                  onPressed: () {
                    dolar_cop();
                   text = ('pesos colombianos');
                  },
                  child: const Text('DOLAR A COP')),
              const SizedBox(height: 10),
              ElevatedButton(
                  onPressed: () {
                    cop_dolar();
                    text = ('dolares');
                  },
                  child: const Text('COP A DOLAR')),
              const SizedBox(height: 10),
             
              Text('La conversión equivale a: $resultado $text')
            ],
          ),
        ),
      ),
    );
  }
}