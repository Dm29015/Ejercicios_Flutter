
import 'package:flutter/material.dart';
import 'package:formularios/screens/cilindro.dart';
import 'package:formularios/screens/divisas.dart';
import 'package:formularios/screens/imc.dart';

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
            title: const Text('Cilindro'),
            trailing: const Icon(Icons.navigate_next_outlined),
            onTap: () {
              final route =
                  MaterialPageRoute(builder: (context) => const Cilindro());
              Navigator.push(context, route);
            },
          ),

          ListTile(
            leading: const Icon(Icons.book),
            title: const Text('Divisas'),
            trailing: const Icon(Icons.navigate_next_outlined),
            onTap: () {
              final route =
                  MaterialPageRoute(builder: (context) => const Divisas());
              Navigator.push(context, route);
            },
          ),
          ListTile(
            leading: const Icon(Icons.book),
            title: const Text('IMC'),
            trailing: const Icon(Icons.navigate_next_outlined),
            onTap: () {
              final route =
                  MaterialPageRoute(builder: (context) => const IMC());
              Navigator.push(context, route);
            },
          ),
        ],
      ),
    );
  }
}
