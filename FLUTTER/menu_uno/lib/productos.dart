import 'package:flutter/material.dart';

class Pedidos extends StatefulWidget {
  const Pedidos({super.key});

  @override
  State<Pedidos> createState() => _PedidosState();
}

class _PedidosState extends State<Pedidos> {
  TextEditingController cantidadController = TextEditingController();
  TextEditingController precioController = TextEditingController();
  String resultado = ' ';

  final List<String> productos = ['PC','Laptop','celular','Tablet','Aufionos','Mouse'];
  final List<String> descuentos = ['5','10','20','50'];

  String? _valorSeleccionado; //
    String? _valorSeleccionado1;

void calcularTotal(){

  double cantidad = double.parse(cantidadController.text);
  double precio = double.parse(precioController.text);
  double descuento = double.parse(_valorSeleccionado1!);
  double total = cantidad * precio - (cantidad * precio * descuento) / 100;
  resultado = total.toString();
  setState(() { });
 
}
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pedidos'),
        leading: const Icon(Icons.rectangle_outlined),
      ),
      body: Center(
        child: SizedBox(
          width: 300,
          height: 400,
          child: Column(
            children: [
              DropdownButton<String>(
                hint: const Text('Seleccione un producto'),
                value: _valorSeleccionado,
                onChanged: (String? nuevoValor) {
                  setState(() {
                    _valorSeleccionado = nuevoValor;
                  });
                },
                items:
                    productos.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value));
                }).toList(),
              ),

               DropdownButton<String>(
                hint: const Text('Seleccione el descuento'),
                value: _valorSeleccionado1,
                onChanged: (String? nuevoValor) {
                  setState(() {
                    _valorSeleccionado1 = nuevoValor;
                  });
                },
                items:
                    descuentos.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value));
                }).toList(),
              ),

              TextField(
                controller: cantidadController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    labelText: 'Cantidad',
                    labelStyle: TextStyle(
                        fontWeight: FontWeight.w100,
                        color: Color.fromARGB(255, 2, 183, 98))),
                style:
                    const TextStyle(color: Colors.black87), // Color del texto
              ),
              TextField(
                controller: precioController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    labelText: 'Precio',
                    labelStyle: TextStyle(
                        fontWeight: FontWeight.w100,
                        color: Color.fromARGB(255, 2, 183, 98))),
              ),
              ElevatedButton(
                  onPressed: () {
                    calcularTotal();
                  },
                  child: const Text('Calcular')),
                  const SizedBox(height: 10),
              // print(resultado),
              Text('Valor total: $resultado')
            ],
          ),
        ),
      ),
    );
  }
}
