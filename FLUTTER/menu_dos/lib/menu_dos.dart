import 'package:flutter/material.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}


class _MenuState extends State<Menu> {
  String contenido = '';
  int selectedIndex = 0;

  void itemSeleccionado(index){
    
  selectedIndex = index;

    switch (index){
      case 0:
       contenido =  ('home');
        break;
      case 1:
       contenido = ('product');
        break;
      case 2:
       contenido = ('contact');
        break;
      default:
        break;
    }
    
  setState(() {});
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu 2'),
      ),
      body: Center(child: Text(contenido)),
      
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
