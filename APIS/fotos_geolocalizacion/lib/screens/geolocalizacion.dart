import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class Geolocalizacion extends StatefulWidget {
  const Geolocalizacion({super.key});

  @override
  State<Geolocalizacion> createState() => _GeolocalizacionState();
}

class _GeolocalizacionState extends State<Geolocalizacion> {
  String? _location;

  Future<void> _getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      setState(() {
        _location =
            'Latitud: ${position.latitude}, Longitud: ${position.longitude}';
      });
    } catch (e) {
      print(e.toString());
      setState(() {
        _location = 'Error al obtener la ubicación.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Geolocalización'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _location == null
                ? Text('No se ha obtenido la ubicación.')
                : Text(_location!),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _getCurrentLocation,
              child: Text('Obtener Ubicación'),
            ),
          ],
        ),
      ),
    );
  }

}