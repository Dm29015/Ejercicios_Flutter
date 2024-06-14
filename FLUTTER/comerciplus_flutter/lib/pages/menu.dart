import 'package:comerciplus_flutter/pages/Clientes/ListarClientes.dart';
import 'package:comerciplus_flutter/pages/Proveedores/ListarProveedores.dart';
import 'package:flutter/material.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  String contenido = '';
  int selectedIndex = 0;

  void itemSeleccionado(index) {
    setState(() {
      selectedIndex = index;
      switch (index) {
        case 0:
          contenido = 'Proveedores';
          break;

        case 1:
          contenido = 'Clientes';
          break;

        default:
          contenido = '';
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:const Color.fromARGB(255, 42, 54, 68),
      body: Center(
        child: selectedIndex == 0
            ? const Proveedores()
            : selectedIndex == 1
                ? const Clientes()
                    : Container(), // Opción por defecto
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor:const Color.fromARGB(255, 42, 54, 68),
        
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.local_shipping_outlined), label: 'Proveedores'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              label: 'Clientes'),

        ],
        currentIndex: selectedIndex,
        selectedItemColor: Colors.amber.shade300,
        unselectedItemColor: const Color.fromRGBO(255, 214, 79, 0.5),
        onTap: itemSeleccionado,
      ),
    );
  }
}
