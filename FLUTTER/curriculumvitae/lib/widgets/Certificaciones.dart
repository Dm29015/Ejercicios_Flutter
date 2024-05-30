// ignore_for_file: file_names

import 'package:flutter/material.dart';

class Certificaciones extends StatelessWidget {
  final String titulo, fecha;

  const Certificaciones({
    super.key,
    required this.titulo,
    required this.fecha,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        titulo,
        style: const TextStyle(color: Colors.white, fontSize: 13),
        maxLines: 2, // Limita el número máximo de líneas a 2
        overflow: TextOverflow.ellipsis, // Muestra puntos suspensivos cuando el texto se desborda
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            fecha,
            style: const TextStyle(color: Colors.white60),
          )
        ],
      ),
    );
  }
}
