import 'package:clase14_05_2024/calculadora.dart';
import 'package:clase14_05_2024/productos.dart';
import 'package:clase14_05_2024/rectangulo.dart';
import 'package:flutter/material.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.menu_book_rounded),
        title: const Text("Menú"),
        backgroundColor: const Color.fromARGB(255, 13, 87, 126),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.book),
            title: const Text('Rectángulo'),
            // subtitle: const Text('Aquí va el rectangulo'),
            trailing: const Icon(Icons.navigate_next_outlined),
            onTap: () {
              final route =
                  MaterialPageRoute(builder: (context) => const Rectangulo());
              Navigator.push(context, route);
            },
          ),

          ListTile(
            leading: const Icon(Icons.book),
            title: const Text('Calculadora'),
            trailing: const Icon(Icons.navigate_next_outlined),
            onTap: () {
              final route =
                  MaterialPageRoute(builder: (context) => const Calculadora());
              Navigator.push(context, route);
            },
          ),

          ListTile(
            leading: const Icon(Icons.book),
            title: const Text('Pedidos'),
            trailing: const Icon(Icons.navigate_next_outlined),
            onTap: () {
              final route =
                  MaterialPageRoute(builder: (context) => const Pedidos());
              Navigator.push(context, route);
            },
          ),
        ],
      ),
    );
  }
}
