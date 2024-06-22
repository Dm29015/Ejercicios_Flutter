import 'package:flutter/material.dart';
import 'package:fotos_geolocalizacion/screens/fotos.dart';
import 'package:fotos_geolocalizacion/screens/geolocalizacion.dart';
import 'package:fotos_geolocalizacion/screens/mapa.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    const Foto(),
    const Geolocalizacion(),
    const Mapa(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Foto y Geolocalización'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.camera_alt),
            label: 'Tomar Foto',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_on),
            label: 'Geolocalización',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: 'Mapa',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}
