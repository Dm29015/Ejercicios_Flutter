
import 'package:flutter/material.dart';

class CardW extends StatelessWidget {
  final String proveedor;

  const CardW({super.key, required this.proveedor});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(111, 119, 133, 0.192),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.business, color: Colors.amber, size: 40),
          const SizedBox(width: 10.0),
          Text(
            proveedor,
            style: const TextStyle(
                color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

class CardInfo extends StatelessWidget {
  final String dato;
  final IconData icono;
  final Color colorIcono;

  const CardInfo(
      {super.key,
      required this.dato,
      required this.icono,
      required this.colorIcono});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
          color: const Color.fromRGBO(111, 119, 133, 0.192),
          borderRadius: BorderRadius.circular(20.0)),
      child: Row(
        children: [
          Icon(icono, color: colorIcono, size: 30),
          const SizedBox(width: 10.0),
          Flexible(
            child: Text(
              dato,
              style: const TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}