import 'package:flutter/material.dart';
//import 'package:flutter/widgets.dart';

class Rectangulo extends StatefulWidget {
  const Rectangulo({super.key});

  @override
  State<Rectangulo> createState() => _RectanguloState();
}

class _RectanguloState extends State<Rectangulo> {
  TextEditingController largoController = TextEditingController();
  TextEditingController anchoController = TextEditingController();
  String resultado = ' ';
  final List<String> unidadMedida = ['M', 'CM', 'KM'];
  String? _valorSeleccionado; //
  void calcularArea() {
    try {
      double largo = double.parse(largoController.text);
      double ancho = double.parse(anchoController.text);
      double area = largo * ancho;
      resultado = (area.toString());
      setState(() {});
    } catch (e) {
      e.toString();
    }
  }

  void calcularPerimetro() {
    try {
      double largo = double.parse(largoController.text);
      double ancho = double.parse(anchoController.text);
      double perimetro = largo + ancho;
      resultado = (perimetro.toString());
      setState(() {});
    } catch (e) {
      e.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rectangulo'),
        leading: const Icon(Icons.rectangle_outlined),
      ),
      body: Center(
        child: SizedBox(
          width: 300,
          height: 400,
          child: Column(
            children: [
              DropdownButton<String>(
                hint: const Text('Seleccione una unidad de medida'),
                value: _valorSeleccionado,
                onChanged: (String? nuevoValor) {
                  setState(() {
                    _valorSeleccionado = nuevoValor;
                  });
                },
                items:
                    unidadMedida.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value));
                }).toList(),
              ),
              TextField(
                controller: largoController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    labelText: 'Largo',
                    labelStyle: TextStyle(
                        fontWeight: FontWeight.w100,
                        color: Color.fromARGB(255, 2, 183, 98))),
                maxLength: 3,
                style:
                    const TextStyle(color: Colors.black87), // Color del texto
              ),
              TextField(
                controller: anchoController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    labelText: 'Ancho',
                    labelStyle: TextStyle(
                        fontWeight: FontWeight.w100,
                        color: Color.fromARGB(255, 2, 183, 98))),
                maxLength: 3,
              ),
              ElevatedButton(
                  onPressed: () {
                    calcularArea();
                  },
                  child: const Text('Calcular Área')),
              const SizedBox(height: 10),
              ElevatedButton(
                  onPressed: () {
                    calcularPerimetro();
                  },
                  child: const Text('Calcular Perímetro')),
              const SizedBox(height: 10),
              Text('Resultado: $resultado $_valorSeleccionado')
            ],
          ),
        ),
      ),
    );
  }
}
