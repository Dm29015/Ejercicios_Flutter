import 'package:flutter/material.dart';
import 'package:menu_dos/screens/mision.dart';

class Menu2 extends StatefulWidget {
  const Menu2({super.key});

  @override
  State<Menu2> createState() => _Menu2State();
}

class _Menu2State extends State<Menu2> {
  int selectedIndex = 0;
  String contenido = '';

  void itemSeleccionado(index) {
    setState(() {
      selectedIndex = index;
      switch (index) {
        case 0:
          contenido = "este es el home";
          break;
        case 1:
          contenido = "Lista de productos";
        case 2:
          contenido = "Contacto";
        default:
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Menu 2")),
      ),
      drawer: Drawer(
        width: 300,
        elevation: 100,
        backgroundColor: Colors.white,
        child: ListView(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration:
                  const BoxDecoration(color: Colors.purple),
              child: const Text("Menu",
                  style: TextStyle(color: Colors.black38, fontSize: 23.5)),
            ),
            ListTile(
              leading: const Icon(Icons.home_outlined),
              title: const Text("Inicio"),
              hoverColor: const Color.fromARGB(255, 127, 206, 249),
              onTap: () {
                Navigator.push(context,MaterialPageRoute(builder:(context) => const Mision(),));
              },
            ),
            ListTile(
              leading: const Icon(Icons.task_outlined),
              title: const Text("Mision"),
              hoverColor: const Color.fromARGB(255, 127, 206, 249),
              onTap: () {
                Navigator.push(context,MaterialPageRoute(builder:(context) => const Mision(),));
              },
            ),
            ListTile(
              leading: const Icon(Icons.view_array_outlined),
              title: const Text("Vision"),
              hoverColor: const Color.fromARGB(255, 127, 206, 249),
              onTap: () {
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
      body: Text(contenido),

      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>
        [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.search_outlined), label: 'Product'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline), label: 'Contact'),
        ],
        currentIndex: selectedIndex,
        selectedItemColor: Colors.purple.shade600,
        onTap: itemSeleccionado,
      ),
    );
  }
}