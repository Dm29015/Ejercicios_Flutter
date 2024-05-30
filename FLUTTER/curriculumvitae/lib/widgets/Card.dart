// ignore_for_file: file_names

import 'package:flutter/material.dart';

class Card2 extends StatelessWidget {
  final String titulo, institucion, fecha;
  final Color colorIcon;

  const Card2({
    super.key,
    required this.colorIcon,
    required this.titulo,
    required this.institucion,
    required this.fecha,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Container(
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: const Color(0xff1F1E25),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Row(
          children: [
            Container(
              height: 45,
              width: 45,
              decoration: BoxDecoration(
                color: colorIcon,
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: const Icon(Icons.border_color_outlined, color: Colors.white),
            ),
            const SizedBox(width: 15.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    titulo,
                    style: const TextStyle(color: Colors.white, fontSize: 16),
                    maxLines: 2, // Limita el número máximo de líneas a 2
                    overflow: TextOverflow.ellipsis, // Muestra puntos suspensivos si el texto se desborda
                  ),
                  const SizedBox(height: 7.0),
                  Text(
                    institucion,
                    style: const TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                  Text(
                    fecha,
                    style: const TextStyle(color: Colors.grey, fontSize: 15),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
