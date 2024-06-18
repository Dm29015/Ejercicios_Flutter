import 'package:curriculumvitae/pages/infoPersonal.dart';
import 'package:curriculumvitae/pages/experiencia.dart';
import 'package:curriculumvitae/pages/educacion.dart';
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
          contenido = 'Información personal';
          break;

        case 1:
          contenido = 'Información académica';
          break;

        case 2:
          contenido = 'Experiencia';
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
      
      body: Center(
        child: selectedIndex == 0
            ? const InfoPersonal()
            : selectedIndex == 1
                ? const educacion() 
                : selectedIndex == 2
                    ? const experiencia() 
                    : Container(), // Opción por defecto
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.account_box_outlined), label: 'Sobre mí'),
          BottomNavigationBarItem(
              icon: Icon(Icons.collections_bookmark_outlined),
              label: 'Educación'),
          BottomNavigationBarItem(
              icon: Icon(Icons.work_history_outlined), label: 'Experiencia'),
        ],
        currentIndex: selectedIndex,
        selectedItemColor: Colors.purple.shade600,
        onTap: itemSeleccionado,
      ),
    );
  }
}
